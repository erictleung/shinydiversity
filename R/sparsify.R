library("phyloseq"); packageVersion("phyloseq")

replaceX <- function(vec, p) {
  N = round(p*length(vec))
  inds = sample(1:length(vec), N, replace=F)
  vec[inds] = 0
  vec
}

sparsify <- function(otu_table, p) {
  # otu_table: columns are samples and rows are OTUs
  # p: percent of random OTUs in a sample to replace with zeros.
  df=apply(otu_table, MARGIN = 2, function(x) replaceX(x, p))
  otu_table(df, taxa_are_rows = TRUE)
}