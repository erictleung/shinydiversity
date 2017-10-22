source("home/ui.R")
source("alpha/ui.R")
source("beta/ui.R")
source("docs/ui.R")

ui <- navbarPage(
    title = "ShinyDiversity",
    inverse = TRUE,
    tabPanel(
        "Home",
        homeUI("homeUI")
    ),
    tabPanel(
        "Alpha",
        alphaUI("alphaUI")
    ),
    tabPanel(
        "Beta",
        betaUI("betaUI")
    ),
    tabPanel(
        "Alpha Docs",
        docsUIalpha("docsUIalpha")
    ),
    tabPanel(
        "Beta Docs",
        docsUIbeta("docsUIbeta")
    )
)