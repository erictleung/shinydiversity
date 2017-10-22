library(ggplot2)
library(knitr)
library(markdown)
library(rmarkdown)
library(phyloseq)
library(phyloseq); packageVersion("phyloseq")
library(plyr)

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
    navbarMenu("Documentation",
        tabPanel("Alpha",
                 docsUIalpha("docsUIalpha")
        ),
        tabPanel("Beta",
                 docsUIbeta("docsUIbeta")
        )
    )
)