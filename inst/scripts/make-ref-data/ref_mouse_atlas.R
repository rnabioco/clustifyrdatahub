library(Seurat)
library(clustifyr)
library(tidyverse)

# 2023-11-07, this code isn't valid but keeping to follow data provenance
#
# At some point the `MouseAtlas.rda` file referenced below was a Seurat object. 
# It is actually however a .rds file (saved with an .rda extension unfortunately)
# with a matrix of logcounts. The original seurat object was made using this code: 
# https://github.com/rnabioco/scRNA-seq-Cell-Ref-Matrix/blob/master/R/musMusculus/mouseAtlas.r
#
# Also note that the code below is not valid (see `-` in object names) so was
# likely never run. 
#
# To fix, will upload an actual .rda version of the logcounts to the experimenthub
# with the same filename as the invalid .rds version "ref_mouse_atlas.rda"
# see also https://github.com/rnabioco/clustifyrdatahub/issues/4

mouse-atlas <- readRDA("https://github.com/rnabioco/scRNA-seq-Cell-Ref-Matrix/blob/master/atlas/musMusculus/MouseAtlas.rda")
mouse-atlas_p <- parse_loc_object(mouse-atlas)

usethis::use_data(mouse-atlas_p, compress = "xz", overwrite = TRUE)