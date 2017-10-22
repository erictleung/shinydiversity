# shinydiversity

[![Build Status](https://travis-ci.org/erictleung/shinydiversity.svg?branch=master)](https://travis-ci.org/erictleung/shinydiversity)
[![Join the chat at https://gitter.im/erictleung/shinydiversity](https://badges.gitter.im/erictleung/shinydiversity.svg)](https://gitter.im/erictleung/shinydiversity?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Interactive application to explore various ecological diversity metrics

**Table of Contents**

- [To Run](#to-run)
- [Prerequisites for Local Development](#prerequisites-for-local-development)
- [Problem](#problem)
- [Proposed Project](#proposed-project)

## To Run

```R
# Install Shiny
install.packages("shiny")

# Run application
library(shiny)
runGitHub("shinydiversity", "erictleung")
```

## Prerequisites for Local Development

**Development Environments**

- R (https://www.r-project.org/)
- RStudio (https://www.rstudio.com/)

**R Packages**

- `shiny` R package (http://shiny.rstudio.com/)
- `phyloseq` R package (http://joey711.github.io/phyloseq/)

## Problem

There are many alpha and beta diversity metrics to analyze microbial ecological
or microbiome data. Alpha diversity describes an estimate of the total number
of species in a sample. Beta diversity describes the differences between
samples. Below are some example of then number of metrics you can use.

<img src="images/alpha_diversities.png" alt="Drawing" style="width: 100%;"/>

###### Plot from "Alpha diversity graphics" page for phyloseq showing various alpha diversity metrics to choose from http://joey711.github.io/phyloseq/plot_richness-examples

Below is are just a few beta diversity metrics choose from

```R
> library(phyloseq)
> unlist(distanceMethodList)
    UniFrac1     UniFrac2        DPCoA          JSD     vegdist1     vegdist2
   "unifrac"   "wunifrac"      "dpcoa"        "jsd"  "manhattan"  "euclidean"
    vegdist3     vegdist4     vegdist5     vegdist6     vegdist7     vegdist8
  "canberra"       "bray" "kulczynski"    "jaccard"      "gower"   "altGower"
    vegdist9    vegdist10    vegdist11    vegdist12    vegdist13    vegdist14
  "morisita"       "horn"  "mountford"       "raup"   "binomial"       "chao"
   vegdist15   betadiver1   betadiver2   betadiver3   betadiver4   betadiver5
       "cao"          "w"         "-1"          "c"         "wb"          "r"
  betadiver6   betadiver7   betadiver8   betadiver9  betadiver10  betadiver11
         "I"          "e"          "t"         "me"          "j"        "sor"
 betadiver12  betadiver13  betadiver14  betadiver15  betadiver16  betadiver17
         "m"         "-2"         "co"         "cc"          "g"         "-3"
 betadiver18  betadiver19  betadiver20  betadiver21  betadiver22  betadiver23
         "l"         "19"         "hk"        "rlb"        "sim"         "gl"
 betadiver24        dist1        dist2        dist3   designdist
         "z"    "maximum"     "binary"  "minkowski"        "ANY"
> length(unlist(distanceMethodList))
[1] 47
```

With so many metrics to choose from, how do you know which is the "best" and
how will your data affect the calculation of these metrics?

## Proposed Project

Create an interactive Shiny application to show changes in your chosen alpha or
beta diversity metrics to see how each change based on simulated or real data.
Some of these metrics are sensitive to single or double counts of species so
this will be good to see how different distributions of counts will change
these metrics and your interpretations of them. This should be designed to give
an intuitive understanding of how these metrics work.
