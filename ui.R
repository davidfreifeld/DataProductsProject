library(shiny)
shinyUI(pageWithSidebar(
    
    headerPanel("NHL 2014-15 Points Predictor"),
    
    sidebarPanel(
        h3('Stats to Include in Model'),
        checkboxInput("cbGF", "Goals For", value=T),
        checkboxInput("cbGA", "Goals Against", value=T),
        checkboxInput("cbPP", "Power Play Percentage", value=T),
        checkboxInput("cbPK", "Penalty Kill Percentage", value=T)
    ),

    mainPanel(
        h3('Predicted Team Points from Linear Model'),
        textOutput('prediction'),
        conditionalPanel(
            condition = "input.cbGF == true",
            numericInput('iGF', 'Goals For Input', 0, min=0, step=1)
        ),
        conditionalPanel(
            condition = "input.cbGA == true",
            numericInput('iGA', 'Goals Against Input', 0, min=0, step=1)
        ),
        conditionalPanel(
            condition = "input.cbPP == true",
            numericInput('iPP', 'PP Percentage Input', 0, min=0, max=100, step=0.1)
        ),
        conditionalPanel(
            condition = "input.cbPK == true",
            numericInput('iPK', 'PK Percentage Input', 0, min=0, max=100, step=0.1)
        )
        
    )
))