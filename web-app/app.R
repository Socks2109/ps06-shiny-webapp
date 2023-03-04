#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

earthquake <- read_delim("query.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Earthquake data over the past 30 days in the conterminous US"),
  navbarPage("",
             tabPanel("Intro",
                      h2("Introduction"),
                      p("This dataset was retrieved from USGS. It contains the earthquake data over the past 30 days in the conterminous U.S. (Note that the Conterminous U.S. refers to a rectangular region including the lower 48 states and surrounding areas which are outside the Conterminous U.S.). An image of the conterminous U.S is shown below:"),
                      img(src = "https://d9-wret.s3.us-west-2.amazonaws.com/assets/palladium/production/s3fs-public/thumbnails/image/usmap_0.jpg", height = 200),
                      br(),
                      p("The dataset contains ", nrow(earthquake), " number of rows, and ", ncol(earthquake), " number of columns in this dataset. Some of the aforementioned columns are:"),
                      tags$ul(
                        tags$li("mag: magnitude of the earthquake"),
                        tags$li("magType: method use to compute mag"),
                        tags$li("depth: depth of event, km"),
                      )
             ),
             tabPanel("Plot",
                      h2("Magnitude v.s Depth"),
                      sidebarLayout(
                        sidebarPanel(
                          p("This graph illustrates the relationship between the earthquake's magnitude and depth with the option to choose the magType of the data points."),
                          sliderInput("min",
                                      "Change the minimum magnitude",
                                      min = 2.5,
                                      max = 4.7,
                                      value = 2.5),
                          sliderInput("max",
                                      "Change the maximum magnitude",
                                      min = 2.5,
                                      max = 4.7,
                                      value = 4.7),
                          checkboxGroupInput("type",
                                             "Choose magType",
                                             choices = unique(earthquake$magType)),
                          radioButtons("color",
                                             "Choose color of points",
                                             choices = c("red", "skyblue", "yellow", "pink", "purple"))
                        ),
                        mainPanel(
                          plotOutput("plot"),
                          br(),
                          textOutput("plotText")
                        )
                      )
             ),
             tabPanel("Table",
                      h2("Depth and magnitude errors"),
                      sidebarLayout(
                        sidebarPanel(
                          p("This table shows the user's desired maximum depth and magnitude errors that they would allow, and display the latitudes and longitudes of the data that they deem to be within their range for errors."),
                          br(),
                          sliderInput("dep_err",
                                      "Change the maximum depth error",
                                      min = 0.11,
                                      max = 31.61,
                                      val = 15.0,
                                      step = 0.01),
                          sliderInput("mag_err",
                                      "Change the maximum magnitude error",
                                      min = 0,
                                      max = 0.428,
                                      val = 0.2,
                                      step = 0.001),
                          br(),
                          textOutput("tableText")
                        ),
                        mainPanel(
                          dataTableOutput("table")
                        )
                      )
             )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$plot <- renderPlot({
    earthquake %>%
      filter(mag <= input$max) %>%
      filter(mag >= input$min) %>%
      filter(magType%in%input$type) %>%
      ggplot(aes(x = depth, y= mag)) +
      geom_point(col = input$color) +
      labs(x = "Depth of event (km)", y = "Magnitude of earthquake")
  })
  output$plotText <- renderText({
    paste("The graph has a minimum magnitude of ", input$min, " and has a maximum magnitude of ", input$max, ". It contains the magType(s): ", paste(input$type, collapse=", "))
  })
  output$table <- renderDataTable({
    earthquake %>%
      filter(!is.null(depthError)) %>%
      filter(!is.null(magError)) %>%
      filter(depthError <= input$dep_err) %>%
      filter(magError <= input$mag_err) %>%
      reframe(latitude = round(latitude, 3), longitude = round(longitude, 3), depth = round(depth, 3), mag = round(mag, 3), depthError = round(depthError,3) , magError = round(magError,3))
  })
  output$tableText <- renderText({
    paste("The table has a maximum depth error of ", input$dep_err, " and has a maximum magnitude error of ", input$mag_err, ".")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
