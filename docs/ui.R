library(shiny)
library(knitr)

docsUI <- function(id) {
    # Compile RMarkdown files
    rmdfiles <- c("docs/alpha.Rmd")
    sapply(rmdfiles, knit, quiet = T)

    # Create a namespace function using the provided ID
    ns <- NS(id)

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
                    withMathJax(includeMarkdown("docs/alpha.md"))
                )
            )
        )
    )
}