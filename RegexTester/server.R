#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  #observeEvent(input$goButton, {

    output$textBlob <- renderUI({
      
        #input$goButton

        # Get input text and the regular expression
        rr <- input$regex
        st <- input$samptext
        
        st <- gsub(paste0('(',rr,')'), 
        paste0('<span style="background-color:', input$bgcol, '; color:', input$txtcol,' "> \\1 </span>'), st)
        
        st <- paste0('<h2>Match Output:</h2>', st)

        # return final text 
        renderUI({HTML(st)})

    })

 # })
    
}
