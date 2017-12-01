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
    knit("docs/beta.Rmd", "docs/beta.md", quiet = TRUE)

    # Define the UI for the app
    tagList(
        fluidPage(
            # Application title
            titlePanel("Technical Details on Calculations"),

            # Sidebar with a slider input for number of bins
            fluidRow(
                # Show a plot of the generated distribution
                column(
                    width = 12,
                    withMathJax(includeMarkdown("docs/beta.md"))
                )
            )
        )
    )
}