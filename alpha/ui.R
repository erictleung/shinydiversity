#load phyloseq datasets
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

#create preset singleton/doubleton table
loadSDTable <- function(dataSetName) {
  
  otuData <- loadOTUMatrix(dataSetName)
  
  sdTable <- matrix(nrow = 2, ncol = length(colnames(otuData)))
  
  rownames(sdTable) <- c("Singleton", "Doubleton")
  colnames(sdTable) <- colnames(otuData)
  
  sdTable[1,] <- apply(otuData, 2, function(x) length(which(x == 1)))
  sdTable[2,] <- apply(otuData, 2, function(x) length(which(x == 2)))
  
  t(sdTable)
}

#generate initial data
otuMatrix <- loadOTUMatrix("GlobalPatterns")
sdTable <- loadSDTable("GlobalPatterns")

# Alpha Module UI function
alphaUI <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # NOTE: All referenced input variables must be wrapped with a call to ns(), ex. ns("someInputID")

    # Define the UI for the app
    titlePanel("Alpha Diversity Metrics"),
    selectInput(inputId = "dataSelection", label = "Choose a Dataset", multiple = FALSE, choices = c("GlobalPatterns", "esophagus"), selected = "GlobalPatterns"), 
    checkboxGroupInput(inputId = "groupSelection", label = "Select Metrics", choiceNames = c("ACE", "Shannon", "Simpson", "InvSimpson", "Fisher"), choiceValues = c("ACE", "Shannon", "Simpson", "InvSimpson", "Fisher")), 
    plotOutput(outputId = "phylo"),
    
    titlePanel("Alpha Diversity Summary"),
    tableOutput("table"),
    sliderInput(inputId = "sample", label = "Slide to Move through The Samples", value = 1, step = 1, min = 1, max = length(colnames(otuMatrix))),
    plotOutput(outputId = "heatmap"), plotOutput(outputId = "bar")
}
