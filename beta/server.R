# Calling sparsify & helper functions
source("beta/multiplot.R")
source("beta/plotOrd.R")
source("beta/rarefy.R")
source("beta/sparsify.R")

# Beta Module Server function
betaServer <- function(input, output, session) {
    #  output$ord <- renderPlot({
    #      plotEuclidean <- plotOrd(GP3, distance = "euclidean", title = "euclidean_ord")
    #      plotBray <- plotOrd(GP3, distance = "bray", title = "bray_ord")
    #      plotJaccard <-  plotOrd(GP3, distance = "jaccard", title = "jaccard_ord")
    #      multiplot(plotEuclidean, plotBray, plotJaccard)
    # })

    output$ord_euclidean_norm <- renderPlot({
        normOTU <- rarefy(GP3, count = input$rarefyCount)
        plot(plotOrd(normOTU, distance = "euclidean", title = "euclidean_norm"))
    })

    output$ord_bray_norm <- renderPlot({
        normOTU <- rarefy(GP3, count = input$rarefyCount)
        plot(plotOrd(normOTU, distance = "bray", title = "bray_norm"))
    })

    output$ord_jaccard_norm <- renderPlot({
        normOTU <- rarefy(GP3, count = input$rarefyCount)
        plot(plotOrd(normOTU, distance = "jaccard", title = "jaccard_norm"))
    })

    output$unifracWeighted <- renderPlot({
        plotOrd(GP3, distance = "unifrac", title = "unifrac_Weighted", weighted = TRUE)
    })

    output$unifracUnWeighted <- renderPlot({
        plotOrd(GP3, distance = "unifrac", title = "unifrac_Unweighted", weighted = FALSE)
    })
}
