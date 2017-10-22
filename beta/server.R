# Calling sparcify & helper functions
source("R/sparsify.R")

# Beta Module Server function

betaServer <- function(input, output, session) {
    # TODO: Put Server logic here
     output$ord <- renderPlot({
        multiplot(plotEuclidean, plotBray, plotJaccard)
    })

    output$ord_norm <- renderPlot({

        normOTU <- rarefy(GP3, count = input$rarefyCount)
        plotEuclidean_norm <- plotOrd(normOTU, distance = "euclidean", title = "euclidean_norm")
        plotBray_norm <- plotOrd(normOTU, distance = "bray", title = "bray_norm")
        plotJaccard_norm <-  plotOrd(normOTU, distance = "jaccard", title = "jaccard_norm")
        multiplot(plotEuclidean_norm, plotBray_norm, plotJaccard_norm)
    })

    output$unifracWeighted <- renderPlot({
        plotOrd(GP3, distance = "unifrac", title = "unifrac_Weighted", weighted = TRUE)
    })

    output$unifracUnWeighted <- renderPlot({
        plotOrd(GP3, distance = "unifrac", title = "unifrac_Unweighted", weighted = FALSE)
    })
}
