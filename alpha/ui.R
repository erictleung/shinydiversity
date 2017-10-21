# Alpha Module UI funciton
alphaUI <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # NOTE: All referenced input variables must be wrapped with a call to ns(), ex. ns("someInputID")

    # Define the UI for the app
    tagList(
        fluidPage(
            titlePanel("Alpha Diversiy"),

            # Sidebar layout
            sidebarLayout(

                # Sidebar panel
                sidebarPanel(
                    selectInput(
                        inputId = ns("dataSelection"),
                        label = "Choose a Dataset",
                        choices = c("Global Patterns" = "global", "Esophagus" = "esophagus"),
                        selected = "global"
                    ),
                    checkboxGroupInput(
                        inputId = ns("groupSelection"),
                        label = "Select Metrics",
                        choiceNames = c("ACE", "Shannon", "Simpson", "InvSimpson", "Fisher"),
                        choiceValues = c("ACE", "Shannon", "Simpson", "InvSimpson", "Fisher")
                    ),
                    selectInput(
                        inputId = ns("plotTheme"),
                        label = "Choose a theme for the Plots",
                        choices = c("Grey theme", "Black & White theme","Classic theme"),
                        selected = "Grey theme"
                    ),
                    sliderInput(inputId = ns("p"),
                                label = "Choose a percentage to sparcify",
                                value = 0.25, min = 0, max = 1)
                ),

                # Main panel
                mainPanel(
                    plotOutput(outputId = ns("phylo"))
                )
            )
        )
    )
}
