
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clustifyrdatahub

clustifyrdatahub provides external reference data sets for cell-type
assignment with [clustifyr](https://rnabioco.github.io/clustifyr).

## Installation

``` r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("clustifyrdatahub")
```

## Available references include

``` r
knitr::kable(dplyr::select(
  read.csv(system.file("extdata", "metadata.csv", package = "clustifyrdatahub")),
  c(1, 9, 2:7)))
```

| Title                    | Species      | Description                                      | RDataPath                                     | BiocVersion | Genome | SourceType | SourceUrl                                                                                            |
| :----------------------- | :----------- | :----------------------------------------------- | :-------------------------------------------- | ----------: | :----- | :--------- | :--------------------------------------------------------------------------------------------------- |
| ref\_MCA                 | Mus musculus | Mouse Cell Atlas                                 | clustifyrdatahub/ref\_MCA.rda                 |        3.12 | mm10   | Zip        | <https://ndownloader.figshare.com/files/10756795>                                                    |
| ref\_tabula\_muris\_drop | Mus musculus | Tabula Muris (10X)                               | clustifyrdatahub/ref\_tabula\_muris\_drop.rda |        3.12 | mm10   | Zip        | <https://ndownloader.figshare.com/articles/5821263>                                                  |
| ref\_tabula\_muris\_facs | Mus musculus | Tabula Muris (SmartSeq2)                         | clustifyrdatahub/ref\_tabula\_muris\_facs.rda |        3.12 | mm10   | Zip        | <https://ndownloader.figshare.com/articles/5821263>                                                  |
| ref\_mouse.rnaseq        | Mus musculus | Mouse RNA-seq from 28 cell types                 | clustifyrdatahub/ref\_mouse.rnaseq.rda        |        3.12 | mm10   | RDA        | <https://github.com/dviraran/SingleR/tree/master/data>                                               |
| ref\_moca\_main          | Mus musculus | Mouse Organogenesis Cell Atlas (main cell types) | clustifyrdatahub/ref\_moca\_main.rda          |        3.12 | mm10   | RDA        | <https://oncoscape.v3.sttrcancer.org/atlas.gs.washington.edu.mouse.rna/downloads>                    |
| ref\_immgen              | Mus musculus | Mouse sorted immune cells                        | clustifyrdatahub/ref\_immgen.rda              |        3.12 | mm10   | RDA        | <https://github.com/dviraran/SingleR/tree/master/data>                                               |
| ref\_hema\_microarray    | Homo sapiens | Human hematopoietic cell microarray              | clustifyrdatahub/ref\_hema\_microarray.rda    |        3.12 | hg38   | TXT        | <https://ftp.ncbi.nlm.nih.gov/geo/series/GSE24nnn/GSE24759/matrix/GSE24759_series_matrix.txt.gz>     |
| ref\_cortex\_dev         | Homo sapiens | Human cortex development scRNA-seq               | clustifyrdatahub/ref\_cortex\_dev.rda         |        3.12 | hg38   | TSV        | <https://cells.ucsc.edu/cortex-dev/exprMatrix.tsv.gz>                                                |
| ref\_pan\_indrop         | Homo sapiens | Human pancreatic cell scRNA-seq (inDrop)         | clustifyrdatahub/ref\_pan\_indrop.rda         |        3.12 | hg38   | RDA        | <https://scrnaseq-public-datasets.s3.amazonaws.com/scater-objects/baron-human.rds>                   |
| ref\_pan\_smartseq2      | Homo sapiens | Human pancreatic cell scRNA-seq (SmartSeq2)      | clustifyrdatahub/ref\_pan\_smartseq2.rda      |        3.12 | hg38   | RDA        | <https://scrnaseq-public-datasets.s3.amazonaws.com/scater-objects/segerstolpe.rds>                   |
| ref\_mouse\_atlas        | Mus musculus | Mouse Atlas scRNA-seq from 321 cell types        | clustifyrdatahub/ref\_mouse\_atlas.rda        |        3.12 | mm10   | RDA        | <https://github.com/rnabioco/scRNA-seq-Cell-Ref-Matrix/blob/master/atlas/musMusculus/MouseAtlas.rda> |

## To use `clustifyrdatahub`

``` r
library(ExperimentHub)
eh <- ExperimentHub()

## query
refs <- query(eh, "clustifyrdatahub")
refs
#> ExperimentHub with 11 records
#> # snapshotDate(): 2020-09-10
#> # $dataprovider: figshare, S3, GitHub, GEO, washington.edu, UCSC
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
#>   ...      ...                  
#>   EH3450 | ref_hema_microarray  
#>   EH3451 | ref_cortex_dev       
#>   EH3452 | ref_pan_indrop       
#>   EH3453 | ref_pan_smartseq2    
#>   EH3779 | ref_mouse_atlas
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
ref_hema_microarray()[1:5, 1:5]           ## data are loaded
#>        Basophils CD4+ Central Memory CD4+ Effector Memory CD8+ Central Memory
#> DDR1    6.084244            5.967502             5.933039            6.005278
#> RFC2    6.280044            6.028615             6.047005            5.992979
#> HSPA6   6.535444            5.811475             5.746326            5.928349
#> PAX8    6.669153            5.896401             6.118577            6.270870
#> GUCA1A  5.239230            5.232116             5.206960            5.227415
#>        CD8+ Effector Memory
#> DDR1               5.895926
#> RFC2               5.942426
#> HSPA6              5.942670
#> PAX8               6.323922
#> GUCA1A             5.090882
ref_hema_microarray(metadata = TRUE)       ## only metadata
#> ExperimentHub with 1 record
#> # snapshotDate(): 2020-09-10
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

Data sets have uniform suffixes: - `ref_*` : the prebuilt reference
expression matrix.
