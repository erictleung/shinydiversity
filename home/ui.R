# Home Module UI funciton
homeUI <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # NOTE: All referenced input variables must be wrapped with a call to ns(), ex. ns("someInputID")

    # Define the UI for the app
    tagList(
        fluidPage(
            titlePanel("Home"),
            fluidRow(
                column(12, includeMarkdown("README.md"))
            )
        )
    )
}