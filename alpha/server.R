# Alpha Module Server function

alphaServer <- function(input, output, session) {
    # TODO: Put Server logic here
    output$phylo <- renderPlot({
        title <- "Alpha Diversity Metrics"
        selected_theme<-switch(input$plotTheme,
                               "Grey theme" = theme_gray() ,
                               "Black & White theme" =theme_bw(),
                               "Classic theme" = theme_classic()

        )

        theme_set(selected_theme)

        if (input$dataSelection == "global") {
            data("GlobalPatterns")
            plot_richness(GlobalPatterns, measures = c("Observed", input$groupSelection))
        } else if (input$dataSelection == "esophagus") {
            data("esophagus")
            plot_richness(esophagus, measures = c("Observed", input$groupSelection))
        }
    })
}
