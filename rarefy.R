# sub-sample each sample to a specific size, also known as to rarefiy. 
# If on the OTU table is provided, each sample is rarefied to the smallest
# sample size. 
# Optionally, the count paramater may be set to a desired sample size (integer)


rarefy <- function(otu_table, count, min=TRUE) {
  otu_table=otu_table(otu_table, taxa_are_rows = TRUE)
  if(missing(count)) {
    rarefy_even_depth(otu_table, replace = FALSE) #defult is to rarefy to the smallest sample size
  } else {
    rarefy_even_depth(otu_table, replace = FALSE, sample.size=count)
  }
}

# otu_table: (required) An otu table with rows are OTUs and columns as samples. Not a pyloseq-class.
# count:     (optional) A single integer value equal to the number of reads being simulated, also known as the depth