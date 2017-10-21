source("home/server.R")
source("alpha/server.R")
source("beta/server.R")
source("docs/server.R")

library(phyloseq)
library(ggplot2)

# Define server logic and return the server function
server <- function(input, output) {
    homeServer <- callModule(homeServer, "homeUI")

    alphaServer <- callModule(alphaServer, "alphaUI")

    betaServer <- callModule(betaServer, "betaUI")

    docsServer <- callModule(docsServer, "docsUI")
}