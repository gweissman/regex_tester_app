#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Regex Tester"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          textInput('regex', 'Regular expression', value = "\\b[3-6]\\b", width = NULL, placeholder = NULL),
          textAreaInput("samptext", "Sample Text", "Hello world including all of the numbers 1, 2, 3, 4, 5, 6, 7, and 8!", 
                        width = "1000px", height = '250px'),
          colourInput("bgcol", "Background match colour", "powderblue"),
          colourInput("txtcol", "Text match colour", "firebrick")
          
        ),

        # Show a plot of the generated distribution
        mainPanel(
          
          uiOutput("textBlob")

        )
    )
)
