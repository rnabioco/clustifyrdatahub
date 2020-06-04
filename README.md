
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clustifyrdatahub

<!-- badges: start -->

[![R build
status](https://github.com/rnabioco/clustifyrdata/workflows/R-CMD-check/badge.svg)](https://github.com/rnabioco/clustifyrdata/actions)
<!-- badges: end -->

clustifyrdatahub provides external reference data sets for cell-type
assignment with [clustifyr](https://rnabioco.github.io/clustifyr).

Available references include:

    knitr::kable(system.file("extdata", "metadata.csv", package = "clustifyrdatahub"))

To use `clustifyrdatahub`

``` r
library(ExperimentHub)
eh <- ExperimentHub()

## query
refs <- query(eh, "clustifyrdatahub")
refs
#> ExperimentHub with 10 records
#> # snapshotDate(): 2020-06-01
#> # $dataprovider: figshare, S3, GitHub, washington.edu, UCSC, GEO
#> # $species: Mus musculus, Homo sapiens
#> # $rdataclass: data.frame
#> # additional mcols(): taxonomyid, genome, description,
#> #   coordinate_1_based, maintainer, rdatadateadded, preparerclass, tags,
#> #   rdatapath, sourceurl, sourcetype 
#> # retrieve records with, e.g., 'object[["EH3444"]]' 
#> 
#>            title                
#>   EH3444 | ref_MCA              
#>   EH3445 | ref_tabula_muris_drop
#>   EH3446 | ref_tabula_muris_facs
#>   EH3447 | ref_mouse.rnaseq     
#>   EH3448 | ref_moca_main        
#>   EH3449 | ref_immgen           
#>   EH3450 | ref_hema_microarray  
#>   EH3451 | ref_cortex_dev       
#>   EH3452 | ref_pan_indrop       
#>   EH3453 | ref_pan_smartseq2
## either by index or id
ref_hema_microarray <- refs[[7]]         ## load the first resource in the list
ref_hema_microarray <- refs[["EH3450"]]  ## load by EH id

## or list and load
refs <- listResources(eh, "clustifyrdatahub")
ref_hema_microarray <- loadResources(eh, "clustifyrdatahub", "ref_hema_microarray")[[1]]

## use for classification of cell types
res <- clustifyr::clustify(
  input = clustifyr::pbmc_matrix_small,
  metadata = clustifyr::pbmc_meta$classified,
  ref_mat = ref_hema_microarray,
  query_genes = clustifyr::pbmc_vargenes
)
```

Alternatively, see the [reference
page](https://rnabioco.github.io/clustifyrdata/reference) for available
data sets, and [individual ref download
page](https://rnabioco.github.io/clustifyrdata/articles/download_refs.html).

Data sets have uniform suffixes: - `ref_*` : the prebuilt reference
expression matrix.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("rnabioco/clustifyrdatahub")
```
