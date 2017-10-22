#this code still needs to be added to the respective UI/server documents
#it runs by itself
#formmating changes needed to center some of the components
#last thing is to determine how to highlight specific heatmap samples. Also need to link those colors to the barplot

library("shiny")
library("phyloseq")

data("GlobalPatterns")
data("esophagus")

#load preset dataset
loadOTUMatrix <- function(dataSetName) {
  
  otuTable <- otu_table(get(dataSetName))
  otuMatrix <- matrix(nrow = nrow(otuTable), ncol = 0)
  otuMatrix <- apply(otuTable, 2, function(x) cbind(otuMatrix, x))
  rownames(otuMatrix) <- rownames(otu_table(get(dataSetName)))
  colnames(otuMatrix) <- colnames(otu_table(get(dataSetName)))
  otuMatrix
}

otuMatrix <- loadOTUMatrix("GlobalPatterns")

ui <- fluidPage(
  titlePanel("Alpha Diversity Metrics"),
  sidebarLayout(position = "left",
                sidebarPanel(
                             selectInput(inputId = "dataSelection", label = "Choose a Dataset", multiple = FALSE, choices = c("GlobalPatterns", "esophagus"), selected = "GlobalPatterns"), 
                             checkboxGroupInput(inputId = "groupSelection", label = "Select Metrics", choiceNames = c("ACE", "Shannon", "Simpson", "InvSimpson", "Fisher"), choiceValues = c("ACE", "Shannon", "Simpson", "InvSimpson", "Fisher")) 
                ),
                mainPanel(
                          plotOutput(outputId = "phylo")
                )
  ),
  
  titlePanel("Alpha Diversity Summary"),
  
  tableOutput("table"),
  
  mainPanel(
    sliderInput(inputId = "sample", label = "Slide to Move through The Samples", value = 1, step = 1, min = 1, max = length(colnames(otuMatrix)))
  ),
  
  mainPanel(
    fluidRow(
      splitLayout(cellWidths = c("50%", "50%"), plotOutput(outputId = "heatmap"), plotOutput(outputId = "bar"))
    )
  )
)

server <- function(input, output) {
  output$phylo <- renderPlot({
    title <- "Alpha Diversity Metrics"
    
    otuMatrix <- loadOTUMatrix(input$dataSelection)
    plot_richness(get(input$dataSelection), measures = c("Observed", input$groupSelection))
  })
  
  output$heatmap <- renderPlot({
    heatmap(otuMatrix, Colv = NA, Rowv = NA, scale = "row", labRow = FALSE)
  })
  
  output$bar <- renderPlot({
    title <- "dfadfa"
    barplot(otuMatrix[, input$sample], names.arg = rownames(otuMatrix), main = colnames(otuMatrix)[input$sample])
  })
  
  sdTable <- matrix(nrow = 2, ncol = length(colnames(otuMatrix)))
  rownames(sdTable) <- c("Singleton", "Doubleton")
  colnames(sdTable) <- colnames(otuMatrix)
  sdTable[1,] <- apply(otuMatrix, 2, function(x) length(which(x == 1)))
  sdTable[2,] <- apply(otuMatrix, 2, function(x) length(which(x == 2)))
  output$table = renderTable(sdTable,rownames = TRUE )
}

shinyApp(ui = ui, server = server)
