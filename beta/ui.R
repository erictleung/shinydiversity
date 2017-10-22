# Beta Module UI funciton
betaUI <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # NOTE: All referenced input variables must be wrapped with a call to ns(), ex. ns("someInputID")

    # Define the UI for the app
    tagList(
        titlePanel("Beta Diversity Metrics"),
        #plotOutput(outputId = ns("ord")),

        fluidRow(
            column(4, plotOutput(outputId = ns("ord_euclidean_norm"))),
            column(4, plotOutput(outputId = ns("ord_bray_norm"))),
            column(4, plotOutput(outputId = ns("ord_jaccard_norm")))
        ),
        fluidRow(
            column(12,
                   wellPanel(
                       sliderInput(
                           inputId = ns("rarefyCount"),
                           label = "Change Count",
                           min = 100, max = min(sample_sums(GP3)), step = 50, value = 1000))
            )
        ),
        fluidRow(
            column(6, plotOutput(outputId = ns("unifracUnWeighted"))),
            column(6, plotOutput(outputId = ns("unifracWeighted")))
        )
        #checkboxGroupInput(inputId = ns("groupSelection"), label = "Add Methods", inline = TRUE, choiceNames = c("euclidean", "bray", "jaccard"), choiceValues = c(1,2,3))
    )
}
