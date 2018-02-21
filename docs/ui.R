docsUIalpha <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # Compile RMarkdown files
    render("docs/alpha.Rmd", quiet = TRUE)

    # Define the UI for the app
    tagList(
        fluidPage(
            # Sidebar with a slider input for number of bins
            fluidRow(
                # Show a plot of the generated distribution
                column(
                    width = 12,
                    withMathJax(includeHTML("docs/alpha.html"))
                )
            )
        )
    )
}

docsUIbeta <- function(id) {
    # Create a namespace function using the provided ID
    ns <- NS(id)

    # Compile RMarkdown files
    render("docs/beta.Rmd", quiet = TRUE)

    # Define the UI for the app
    tagList(
        fluidPage(
            # Sidebar with a slider input for number of bins
            fluidRow(
                # Show a plot of the generated distribution
                column(
                    width = 12,
                    withMathJax(includeHTML("docs/beta.html"))
                )
            )
        )
    )
}