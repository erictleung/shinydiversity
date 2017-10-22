# Beta Module UI funciton
betaUI <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # NOTE: All referenced input variables must be wrapped with a call to ns(), ex. ns("someInputID")

    # Define the UI for the app
    titlePanel("Beta Diversity Metrics"),
    plotOutput(outputId = "ord"),

    #these should be to the right
    plotOutput(outputId = "ord_norm"),

    sliderInput(inputId = "rarefyCount", label = "Change Count", min = 100, max = min(sample_sums(GP3)), step = 50, value = 1000),
    #checkboxGroupInput(inputId = "groupSelection", label = "Add Methods", inline = TRUE, choiceNames = c("euclidean", "bray", "jaccard"), choiceValues = c(1,2,3))
    plotOutput(outputId = "unifracWeighted"),
    plotOutput(outputId = "unifracUnWeighted")
}
