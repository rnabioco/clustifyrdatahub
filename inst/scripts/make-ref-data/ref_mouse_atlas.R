library(Seurat)
library(clustifyr)
library(tidyverse)

mouse-atlas <- readRDA("https://github.com/rnabioco/scRNA-seq-Cell-Ref-Matrix/blob/master/atlas/musMusculus/MouseAtlas.rda")
mouse-atlas_p <- parse_loc_object(mouse-atlas)

usethis::use_data(mouse-atlas_p, compress = "xz", overwrite = TRUE)