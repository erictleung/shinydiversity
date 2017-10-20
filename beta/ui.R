# Beta Module UI funciton
betaUI <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # NOTE: All referenced input variables must be wrapped with a call to ns(), ex. ns("someInputID")

    # Define the UI for the app
    tagList(
        fluidPage(
            titlePanel("Beta Diversiy"),

            # Sidebar layout
            sidebarLayout(

                # Sidebar panel
                sidebarPanel(
                    # TODO: Sidebar panel UI logic here
                ),

                # Main panel
                mainPanel(
                    # TODO: Main  panel UI logic here
                )
            )
        )
    )
}