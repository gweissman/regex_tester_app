#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server
function(input, output, session) {
  
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

    output$Hist <- renderPlot({
      token_list <- unlist(strsplit(input$samptext, ' '))
      tokens_lengths <- sapply(token_list, nchar)
      hist(tokens_lengths, breaks = input$num_breaks)
    }) 
    
}
