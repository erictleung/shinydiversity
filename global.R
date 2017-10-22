library(ggplot2)
library(knitr)
library(markdown)
library(rmarkdown)
library(phyloseq)
library(phyloseq); packageVersion("phyloseq")
library(plyr)

# Reduce GlobalPattern dataset to only feces, skin, and tongue samples.
data("GlobalPatterns")
data("esophagus")
GP = GlobalPatterns
human = get_variable(GP, "SampleType") %in% c("Feces", "Mock", "Skin", "Tongue")
sample_data(GP)$human <- factor(human)

GP_Feces <- subset_samples(GP, SampleType == "Feces")
GP_Skin <- subset_samples(GP, SampleType == "Skin")
GP_Tongue <- subset_samples(GP, SampleType == "Tongue")

GP3 <- merge_phyloseq(GP_Feces, GP_Skin, GP_Tongue)