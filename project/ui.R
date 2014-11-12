library(shiny)
library(shinyIncubator)

shinyUI(fluidPage(
  progressInit(),
  
  # Application title
  headerPanel("Word Cloud"),
  
  # Sidebar with a slider and selection inputs
  sidebarPanel(width = 5,
               selectInput("selection", "Choose a State of the Union speech:", 
                           choices = books),
               actionButton("update", "Change"),
               hr(),
               sliderInput("freq", 
                           "Minimum Frequency:", 
                           min = 1,  max = 20, value = 5),
               sliderInput("max", 
                           "Maximum Number of Words:", 
                           min = 1,  max = 300,  value = 100)
  ),
  
  # Show Word Cloud
  mainPanel(
    p("The side menu has a list of ", strong("State of the Union")," addresses
            for the years 2005 to 2014. This app uses the text of the 
            selected speech to make a ", strong("word cloud"),". The word 
            cloud can then be adjusted based on the minimum frequency required 
            for the word to appear, and the maximum number of 
            words in the word cloud itself. Enjoy!"),
    plotOutput("plot")
  )
))