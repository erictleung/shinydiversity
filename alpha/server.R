# Alpha Module Server function

alphaServer <- function(input, output, session) {
    # TODO: Put Server logic here
    output$phylo <- renderPlot({
        title <- "Alpha Diversity Metrics"
        otuMatrix <- loadOTUMatrix(input$dataSelection)
        plot_richness(get(input$dataSelection), measures = c("Observed", input$groupSelection))
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
