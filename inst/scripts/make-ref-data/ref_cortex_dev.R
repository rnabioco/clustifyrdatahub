library(clustifyr)
library(tidyverse)

mat <- read_tsv("https://cells.ucsc.edu/cortex-dev/exprMatrix.tsv.gz") %>% tibble::column_to_rownames("gene")
meta <- read_tsv("https://cells.ucsc.edu/cortex-dev/meta.tsv")

ref_cortex_dev <- average_clusters(
  mat,
  meta,
  cluster_col = "WGCNAcluster",
  if_log = FALSE
)

saveRDS(ref_cortex_dev, "ref_cortex_dev")
