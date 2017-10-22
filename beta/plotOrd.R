plotOrd <- function(phyloseq_object, method="PCoA", distance="bray", weighted=NULL, title){
  phyloseq_object.ord=ordinate(phyloseq_object, method, distance, weighted=weighted)
  p2 = plot_ordination(phyloseq_object, ordination=phyloseq_object.ord,
                       type="samples", color="SampleType")
  p2 + geom_polygon(aes(fill=SampleType, alpha=0.3)) + geom_point(size=2) + ggtitle(title)
}

# for Unifrac method, set method="PCoA", distance="unifrac". Set weighted to FALSE or TRUE.

#distance methods: "manhattan" "euclidean" "canberra" "bray" "kulczynski" "jaccard" "gower"
#                  "altGower" "morisita" "horn" "mountford" "raup" "binomial" "chao" "cao"

