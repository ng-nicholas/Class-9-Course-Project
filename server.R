library("shiny")

shinyServer(
    function(input, output) {
        lm_form <- reactive({as.formula(paste0("mpg ~ ",
                                               paste(input$vars,
                                                     collapse = "+")))})
        output$lm_form <- renderPrint(lm_form())
        model_chosen <- reactive({lm(lm_form(), data = mtcars)})
        output$lm_summ <- renderPrint({summary(model_chosen())})

        # Residual plots

        output$res_plot <- renderPlot({par(mfrow = c(2, 2))
                                       plot(model_chosen())})

        # Additional residual diagnostics
        output$dfbeta_tbl <- renderTable({dfbetas(model_chosen())})
    }
)
