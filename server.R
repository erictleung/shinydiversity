library(ggplot2)
library(knitr)
library(markdown)
library(rmarkdown)
library(phyloseq)
library(rmarkdown)
library(phyloseq); packageVersion("phyloseq")
library(plyr)

source("home/server.R")
source("alpha/server.R")
source("beta/server.R")
source("docs/server.R")

# Define server logic and return the server function
server <- function(input, output) {
    homeServer <- callModule(homeServer, "homeUI")

    alphaServer <- callModule(alphaServer, "alphaUI")

    betaServer <- callModule(betaServer, "betaUI")

    docsServer <- callModule(docsServer, "docsUI")
}
