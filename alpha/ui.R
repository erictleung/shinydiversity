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
                    )
                ),

                # Main panel
                mainPanel(
                    plotOutput(outputId = ns("phylo"))
                )
            )
        )
    )
}
