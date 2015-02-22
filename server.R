# server.R
# This is the source code of the full server script for a shiny web application.
# For more information about building applications with shiny visit:
# http://www.rstudio.com/shiny/

library(shiny)
library(lubridate)

# This data is available throughout the application session for each user

sample2001 <- read.csv("sep2001.csv")

# Server side script

shinyServer(function(input, output) {
      
      
# Transform input into text for caption, header and date
      
      formulaText <- reactive({
            paste("Showing variable ", input$variable)
      })
      
      
      output$caption <- renderText({
            formulaText()
      })
      
#      output$odate <- renderPrint({input$date})

      output$odate_range <- renderText({
            paste("input$date_range is", 
                  paste(as.character(input$date_range), collapse = " to ")
            )
      })

      output$ovar <- renderPrint({input$variable})
      
# Slice dataset according to input of date widget and chosen variable

      data_sliced <- reactive({
            subset(sample2001, Month >= month(input$date_range[1]) & Month <= month(input$date_range[2])
                   & DayofMonth >= day(input$date_range[1]) & DayofMonth <= day(input$date_range[2]),
                   select=c("DepDelay","ArrDelay"))
      })
           

      output$numobs <- renderText({
            paste("number of observations is", as.character(nrow(data_sliced())))
      })

# Plot histogram depending on input of variable  
      
      output$myHist <- renderPlot({
            hist(data_sliced()[,input$variable], xlab=input$variable, col='lightblue',main='Histogram', xlim=c(-100,200), breaks=input$breaks)
      })


# Plot dependence between departure and arrival delay
      
      output$myPlot <- renderPlot({
            plot(data_sliced()$DepDelay,data_sliced()$ArrDelay, xlab = "Departure Delay", ylab = "Arrival Delay", col = "blue")
            abline(lm(ArrDelay ~ DepDelay, data = data_sliced()), col = "red")
      })
    
  }
)