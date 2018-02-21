# Calling sparcify & helper functions
source("R/sparsify.R")

# Alpha Module Server function
alphaServer <- function(input, output, session) {
    output$phylo <- renderPlot({
        title <- "Alpha Diversity Metrics"
        otuMatrix <- loadOTUMatrix(input$dataSelection)
        if (input$dataSelection == "esophagus") {
            plot_richness(get(input$dataSelection), measures = c("Observed", input$groupSelection))
        } else {
            plot_richness(get(input$dataSelection), measures = c("Observed", input$groupSelection), color = "SampleType")
        }
    })

    output$heatmap <- renderPlot({
        heatmap(otuMatrix, Colv = NA, Rowv = NA, scale = "row", labRow = FALSE, main = input$dataSelection)
    })

    output$bar <- renderPlot({
        title <- "dfadfa"
        barplot(otuMatrix[, input$sample], names.arg = rownames(otuMatrix), main = colnames(otuMatrix)[input$sample])
    })

    output$table <- renderTable(loadSDTable(input$dataSelection), rownames = TRUE)
}
