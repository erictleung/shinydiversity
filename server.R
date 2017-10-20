source("home/server.R")
source("alpha/server.R")
source("beta/server.R")

library(phyloseq)

# Define server logic and return the server function
server <- function(input, output) {
    homeServer <- callModule(homeServer, "homeUI")

    alphaServer <- callModule(alphaServer, "alphaUI")

    betaServer <- callModule(betaServer, "betaUI")
}