# ui.R
# This is the source code of the user interface for a shiny web application.
# For more information about building applications with shiny visit:
# http://www.rstudio.com/shiny/


shinyUI(
      navbarPage("Airline On-Time Statistics",
            tabPanel("Plot",             
                  sidebarPanel(
                        helpText('This application provides an analysis of on-time statistics of US airlines from september 2001. 
                                 The plots show the frequency of delays in minutes for either the arrival or departure
                                 delay in minutes and the correlation of both. Within the input box below, it is possible to choose
                                    the variable to be displayed, change the number of bins and adjust the considered date range.'),
                        selectInput('variable','Choose a variable to display:', 
                              list("Arrival Delay" = "ArrDelay",
                                   "Departure Delay" = "DepDelay")
                        ),
                        sliderInput('breaks', 'Choose number of bins',value = 100, min = 10, max = 200, step = 5,),
                        dateRangeInput('date_range',
                              label = 'Date range input: yyyy-mm-dd',
                              start = "2001-09-02", end = "2001-09-11",
                              min = "2001-09-01", max = "2001-09-31",
                        )

                  ),
                  mainPanel(
                        h3(textOutput("caption")),
                        verbatimTextOutput("odate_range"),
                        verbatimTextOutput("numobs"),
                        plotOutput('myHist'),
                        plotOutput('myPlot')
                  )     
            ),
                  
            tabPanel("About",      
                  mainPanel(
                       includeMarkdown("about.md")
                  )
            )      
      )
)