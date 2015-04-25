library("shiny")

shinyUI(fluidPage(
    titlePanel("MTCARS Regression Shiny App"),
    sidebarLayout(
        sidebarPanel(
            p("Written by Nicholas Ng on 26 April 2015."),
            p("This shiny app was created as part of the course project for
              class 9 of the Coursera Data Science Specialisation. This is
              a simple shiny app where users can select variables to explore
              relationships against MPG, as an interactive version of class 7's
              course project. Based on the variables selected below, the
              regression results and diagnostic plots will change to guide
              users towards the best selection of variables. Simply check the
              desired checkboxes and click on the submit button to recalculate
              the regression."),
            h3("Controls"),
            checkboxGroupInput("vars", "Variables to include in regression:",
                               c("No. of Cylinders" = "cyl",
                                 "Engine Displacement (cu.in.)" = "disp",
                                 "Gross Horsepower" = "hp",
                                 "Rear Axle Ratio" = "drat",
                                 "Weight (lb/1000)" = "wt",
                                 "Quarter-mile Time" = "qsec",
                                 "Engine Configuration" = "vs",
                                 "Transmission" = "am",
                                 "No. of Forward Gears" = "gear",
                                 "No. of Carburetors" = "carb"),
                               selected = c("cyl", "disp", "hp", "drat",
                                            "wt", "qsec", "vs", "am", "gear",
                                            "carb")),
            submitButton("Submit")
        ),
        mainPanel(
            h3("Chosen regression formula"),
            p("The following formula is what the regression has been based on.
              The variables may appear differently from what has been provided
              in the controls as these are the actual names of the variables in
              the data set."),
            verbatimTextOutput("lm_form"),
            h3("Summary of regression"),
            p("The below presents the regression results based on your selected
              variables."),
            verbatimTextOutput("lm_summ"),
            h3("Regression diagnostics"),
            p("The following are regression diagnostic plots, showing the
              goodness of fit and the influence measures of the included
              variables."),
            plotOutput("res_plot"),
            tableOutput("dfbeta_tbl")
        )
    )
))
