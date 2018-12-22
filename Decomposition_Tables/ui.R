#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Decomposition Table Generator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "dataset",
                  label = h4("Are you using a dataset?"),
                  choices = c("Yes", "No"),
                  selected = "No"),
      conditionalPanel(condition = "input.dataset == 'Yes'",
                       fileInput("file1", "Choose a CSV File",
                                 accept = c(
                                   "text/csv",
                                   "text/comma-separated-values,text/plain",
                                   ".csv"))
      ),
      conditionalPanel(condition = "input.dataset == 'No'",
                       numericInput(inputId = 'row', label= "Input number of rows:", value = 5, min = 1, max = 100, step = 1),
                       numericInput(inputId = 'col', label= "Input number of columns:", value = 5, min = 1, max = 100, step = 1)
                       
      ),
      selectInput(inputId = "design",
                  label = h4("Choose a design"),
                  choices = c("Basic Factorial","Complete Block", "Split Plot/Repeated Measure", "Latin Squares")), 
      conditionalPanel( condition = "input.design =='Basic Factorial'"
                  # add custom options for each test
      ),
      conditionalPanel( condition = "input.design =='Complete Block'"
                        # add custom options for each test
      ),
      conditionalPanel( condition = "input.design =='Split Plot/Repeated Measure'"
                        # add custom options for each test
      ),
      conditionalPanel( condition = "input.design =='Latin Squares'"
                        # add custom options for each test
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       #plotOutput("distPlot"),
      conditionalPanel(condition = "input.dataset == 'No'",
                       for (x in 1:(input$row*input$col)){
                         textInput(inputId = cat('text',x,sep=""))
                       }
      ),
       tableOutput('final_table')
    )
  )
))
