# ui.R
# This is the source code of the user interface for a shiny web application.
# For more information about building applications with shiny visit:
# http://www.rstudio.com/shiny/


shinyUI(
      navbarPage("Airline On-Time Statistics",
            tabPanel("Plot",             
                  sidebarPanel(
                        helpText('Analyse delay times of US planes in the year 2001'),
                        selectInput('variable','Choose a variable to display:', 
                              list("Arrival Delay" = "ArrDelay",
                                   "Departure Delay" = "DepDelay")
                        ),
                        sliderInput('breaks', 'Choose number of bins',value = 50, min = 10, max = 180, step = 10,),
                        dateRangeInput('date_range',
                              label = 'Date range input: yyyy-mm-dd',
                              start = "2001-01-02", end = "2002-01-01",
                              min = "2001-01-01", max = "2001-12-31",
                        )
 #                       dateInput('date', 'Date:', value='2001-01-02', min='2001-01-01', max='2002-01-01')
                  ),
                  mainPanel(
                        h3(textOutput("caption")),
                        verbatimTextOutput("odate_range"),
                        verbatimTextOutput("ovar"),
                        verbatimTextOutput("numobs"),
                        plotOutput('myHist'),
                        plotOutput('myPlot')
                  )     
            ),
                  
            tabPanel("About",      
                  mainPanel(
                        h1('Test', align = "center")
                  )
            )      
      )
)