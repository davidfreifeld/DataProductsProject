library(shiny)
shinyUI(pageWithSidebar(
    
    headerPanel("NHL 2014-15 Points Predictor"),
    
    sidebarPanel(
        h3('Stats to Include in Model'),
        checkboxInput("cbGF", "Goals For", value=T),
        checkboxInput("cbGA", "Goals Against", value=T),
        checkboxInput("cbPP", "Power Play Percentage", value=T),
        checkboxInput("cbPK", "Penalty Kill Percentage", value=T),
        p('This tool uses data from all 30 NHL teams for the 2014-15 season. It creates a 
          multivariate regression model and then outputs the number of points that the model
          predicts that a team with the given stats would have at the end of the season.
          To use this tool, the user should first select which of the four stats (above)
          that he would like to include in the linear model. Then he can get a prediction
          using this model by inputting a value for each of the statistics selected. The
          predicted number of points will appear at the top on the right. Note that the
          default values for each stat are those of the first place New York Rangers.')
    ),

    mainPanel(
        h3('Predicted Team Points from Linear Model'),
        textOutput('prediction'),
        conditionalPanel(
            condition = "input.cbGF == true",
            numericInput('iGF', 'Goals For Input', 248, min=0, step=1)
        ),
        conditionalPanel(
            condition = "input.cbGA == true",
            numericInput('iGA', 'Goals Against Input', 187, min=0, step=1)
        ),
        conditionalPanel(
            condition = "input.cbPP == true",
            numericInput('iPP', 'PP Percentage Input', 16.8, min=0, max=100, step=0.1)
        ),
        conditionalPanel(
            condition = "input.cbPK == true",
            numericInput('iPK', 'PK Percentage Input', 84.3, min=0, max=100, step=0.1)
        )
        
    )
))