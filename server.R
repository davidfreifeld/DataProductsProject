library(shiny)
nhl <- read.csv("NHL14-15.csv")
shinyServer(
    function(input, output) {        
        output$prediction <- renderText({
            columns = c(1, which(c(input$cbGF,
                                   input$cbGA, 
                                   input$cbPP, 
                                   input$cbPK)) + 1)
            if (length(columns) < 2) {
                return("Please select at least one statistic.")
            }
            else {
                nhlSubset <- nhl[,columns]
                model <- lm(P ~ ., data = nhlSubset)
                df <- data.frame(GF=input$iGF, GA=input$iGA, PP=input$iPP, PK=input$iPK)
                pred <- predict(model, newdata=df)
                paste('Predicted Team Points:', round(pred,0))
            }
        })
        
    }
)