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
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        library(titanic)
        library(rpart)
        library(rpart.plot)
        
        my_tree <- rpart(Survived~Age+Sex+Pclass+Fare,
                         data=titanic_train, method="class",
                         cp = input$bins)
        rpart.plot(my_tree)



    })

})


