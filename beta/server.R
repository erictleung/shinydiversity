# Calling sparcify & helper functions
source("R/sparsify.R")

# Beta Module Server function

betaServer <- function(input, output, session) {
    # TODO: Put Server logic here
    output$plot <- renderPlot({
        # TODO: code to plot data points

        # Demo code for slider:
        title <- "Beta Diversity Metrics"
        hist(rnorm(input$p*100), main = title)
        })
}