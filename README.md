
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

``` r
## or load refs by function name (after loading hub library)
library(clustifyrdatahub)
head(ref_hema_microarray())            ## data are loaded
#>        Basophils CD4+ Central Memory CD4+ Effector Memory CD8+ Central Memory
#> DDR1    6.084244            5.967502             5.933039            6.005278
#> RFC2    6.280044            6.028615             6.047005            5.992979
#> HSPA6   6.535444            5.811475             5.746326            5.928349
#> PAX8    6.669153            5.896401             6.118577            6.270870
#> GUCA1A  5.239230            5.232116             5.206960            5.227415
#> UBE1L   6.245670            7.567609             7.228728            6.972703
#>        CD8+ Effector Memory CD8+ Effector Memory RA
#> DDR1               5.895926                6.068653
#> RFC2               5.942426                6.079630
#> HSPA6              5.942670                6.197062
#> PAX8               6.323922                6.106530
#> GUCA1A             5.090882                5.414058
#> UBE1L              7.083431                7.666510
#>        Colony Forming Unit-Granulocyte  Colony Forming Unit-Megakaryocytic 
#> DDR1                           6.133158                            5.840055
#> RFC2                           6.339621                            6.223787
#> HSPA6                          5.926671                            6.118749
#> PAX8                           5.548961                            6.502735
#> GUCA1A                         5.169354                            5.203075
#> UBE1L                          6.992203                            6.301973
#>        Colony Forming Unit-Monocyte  Common myeloid progenitor Early B-cell
#> DDR1                        5.884078                  5.894468     6.391864
#> RFC2                        6.484200                  7.201365     6.508347
#> HSPA6                       7.414021                  6.047013     6.096143
#> PAX8                        6.734008                  6.835819     6.824184
#> GUCA1A                      5.306772                  5.257351     5.249690
#> UBE1L                       6.316434                  6.768343     6.672752
#>        Eosinophill Erythroid_CD34- CD71- GlyA+ Erythroid_CD34- CD71+ GlyA-
#> DDR1      5.855112                    6.382039                    6.078574
#> RFC2      6.228770                    6.531500                    6.738282
#> HSPA6     6.323991                    6.409215                    6.066397
#> PAX8      6.156168                    6.028995                    5.834061
#> GUCA1A    5.287988                    5.597567                    5.391699
#> UBE1L     6.138323                    6.520868                    6.269021
#>        Erythroid_CD34- CD71+ GlyA+ Erythroid_CD34- CD71lo GlyA+
#> DDR1                      6.318064                     6.213817
#> RFC2                      6.320205                     6.608802
#> HSPA6                     6.228563                     6.249870
#> PAX8                      6.218115                     6.535977
#> GUCA1A                    5.612716                     5.534305
#> UBE1L                     6.119606                     6.033251
#>        Erythroid_CD34+ CD71+ GlyA- Granulocyte (Neutrophil)
#> DDR1                      5.861679                 5.833917
#> RFC2                      6.969688                 6.576916
#> HSPA6                     5.882729                 7.792118
#> PAX8                      6.053497                 5.704660
#> GUCA1A                    5.283608                 5.150294
#> UBE1L                     6.515134                 7.155785
#>        Granulocyte (Neutrophilic Metamyelocyte) Granulocyte/monocyte progenitor
#> DDR1                                   5.833306                        5.839079
#> RFC2                                   6.553904                        6.767519
#> HSPA6                                  7.490526                        6.661685
#> PAX8                                   5.632423                        6.319374
#> GUCA1A                                 5.245884                        5.220135
#> UBE1L                                  6.998928                        6.687190
#>        Hematopoietic stem cell_CD133+ CD34dim
#> DDR1                                 5.950970
#> RFC2                                 6.570751
#> HSPA6                                5.733596
#> PAX8                                 5.878362
#> GUCA1A                               5.274890
#> UBE1L                                7.206312
#>        Hematopoietic stem cell_CD38- CD34+ Mature B-cell class able to switch
#> DDR1                              5.885564                           6.387991
#> RFC2                              6.624798                           6.218705
#> HSPA6                             5.923514                           6.890074
#> PAX8                              5.670447                           5.760565
#> GUCA1A                            5.220075                           5.272567
#> UBE1L                             7.281140                           7.271703
#>        Mature B-cell class switched Mature B-cells
#> DDR1                       6.583029       6.716107
#> RFC2                       6.224177       6.447172
#> HSPA6                      6.498508       6.413854
#> PAX8                       5.846651       5.720587
#> GUCA1A                     5.395569       5.389500
#> UBE1L                      7.419469       7.191263
#>        Mature NK cell_CD56- CD16- CD3- Mature NK cell_CD56- CD16+ CD3-
#> DDR1                          5.787686                        5.691603
#> RFC2                          6.346118                        6.345863
#> HSPA6                         6.024851                        8.741871
#> PAX8                          6.460078                        7.013351
#> GUCA1A                        5.143572                        5.176959
#> UBE1L                         6.982037                        6.603870
#>        Mature NK cell_CD56+ CD16+ CD3- Megakaryocyte
#> DDR1                          5.754366      5.987526
#> RFC2                          6.652667      6.147594
#> HSPA6                         6.561003      6.389242
#> PAX8                          6.797919      6.522839
#> GUCA1A                        5.119780      5.269424
#> UBE1L                         6.944813      6.346664
#>        Megakaryocyte/ erythroid progenitor Monocyte Myeloid Dendritic Cell
#> DDR1                              5.741639 5.649500               5.881891
#> RFC2                              6.669614 6.726144               6.274899
#> HSPA6                             5.677596 8.205161               6.989158
#> PAX8                              6.188238 6.112065               6.965479
#> GUCA1A                            5.192397 5.064548               5.126334
#> UBE1L                             6.507367 6.647885               6.252533
#>        Naïve B-cells Naive CD4+ T-cell Naive CD8+ T-cell      NKT
#> DDR1        6.633327          6.199182          6.205459 5.918666
#> RFC2        6.380757          5.986070          5.822920 6.210981
#> HSPA6       5.996253          5.845853          5.650911 7.108207
#> PAX8        5.676502          5.907682          5.741445 7.447800
#> GUCA1A      5.249145          5.306274          5.243730 5.293263
#> UBE1L       7.725809          7.431081          7.717563 6.652199
#>        Plasmacytoid Dendritic Cell Pro B-cell
#> DDR1                      6.289158   6.092417
#> RFC2                      6.428834   6.665571
#> HSPA6                     6.189802   6.194375
#> PAX8                      7.708575   6.816063
#> GUCA1A                    5.358672   5.200036
#> UBE1L                     6.157470   6.327749
ref_hema_microarray(metadata = TRUE)   ## only metadata
#> ExperimentHub with 1 record
#> # snapshotDate(): 2020-06-01
#> # names(): EH3450
#> # package(): clustifyrdatahub
#> # $dataprovider: GEO
#> # $species: Homo sapiens
#> # $rdataclass: data.frame
#> # $rdatadateadded: 2020-05-14
#> # $title: ref_hema_microarray
#> # $description: Human hematopoietic cell microarray
#> # $taxonomyid: 9606
#> # $genome: hg38
#> # $sourcetype: TXT
#> # $sourceurl: https://ftp.ncbi.nlm.nih.gov/geo/series/GSE24nnn/GSE24759/matr...
#> # $sourcesize: NA
#> # $tags: c("SingleCellData", "SequencingData", "MicroarrayData",
#> #   "ExperimentHub") 
#> # retrieve record with 'object[["EH3450"]]'
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
