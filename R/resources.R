#' Matrix of average gene expression per cluster from 
#' single-cell RNA-seq from Tabula Muris (10x genomics).
#'
#' 422,803 droplet libraries, 55,656 of which passed a
#' QC cutoff of 500 genes and 1000 UMI
#'
#' @source <https://tabula-muris.ds.czbiohub.org/>
#' @family ref
#' @examples ref_tabula_muris_drop(metadata = TRUE)
"ref_tabula_muris_drop"

#' Matrix of average gene expression per cluster from 
#' single-cell RNA-seq from Tabula Muris (SMART-Seq2).
#'
#' 53,760 cells from 20 tissues from 8 mice
#'
#' @source <https://tabula-muris.ds.czbiohub.org/>
#' @family ref
#' @examples ref_tabula_muris_facs(metadata = TRUE)
"ref_tabula_muris_facs"

#' Matrix of average gene expression from immgen data
#'
#' 253 mouse immune cell types
#'
#' @source ["SingleR"]
#' @family ref
#' @examples ref_immgen(metadata = TRUE)
"ref_immgen"

#' Matrix of average gene expression from general mouse cell type data
#'
#' 28 general cell types
#'
#' @source ["SingleR"]
#' @family ref
#' @examples ref_mouse.rnaseq(metadata = TRUE)
"ref_mouse.rnaseq"

#' Matrix of average gene expression per cluster from single-cell 
#' RNA-seq pancreas data using indrop method.
#'
#' A sample of 8569 pancreas cells
#'
#' @source <https://hemberg-lab.github.io/scRNA.seq.datasets/human/pancreas/>
#' @family ref
#' @examples ref_pan_indrop(metadata = TRUE)
"ref_pan_indrop"

#' Matrix of average gene expression per cluster from single-cell 
#' RNA-seq pancreas data using smartseq2 method.
#'
#' A sample of 2209 pancreas cells
#'
#' @source <https://hemberg-lab.github.io/scRNA.seq.datasets/human/pancreas/>
#' @family ref
#' @examples ref_pan_smartseq2(metadata = TRUE)
"ref_pan_smartseq2"

#' Matrix of average gene expression per cluster from single-cell
#' sci-RNA-seq3 from Mouse Organogenesis Cell Atlas.
#'
#' 100,000 cells
#'
#' @source <http://atlas.gs.washington.edu/mouse-rna/>
#' @family ref
#' @examples ref_moca_main(metadata = TRUE)
"ref_moca_main"

#' Matrix of average gene detection by microarray on sorted immune
#' cell populations
#'
#' 38 distinct purified populations of human hematopoietic cells
#'
#' @source [https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE24759]
#' @family ref
#' @examples ref_hema_microarray(metadata = TRUE)
"ref_hema_microarray"

#' Matrix of average gene detection on cortex development cell types
#'
#' 47 distinct annotated clusters of human neuronal subtypes
#'
#' @source <https://cells.ucsc.edu/?ds=cortex-dev#>
#' @family ref
#' @examples ref_cortex_dev(metadata = TRUE)
"ref_cortex_dev"

#' Matrix of average gene expression for single-cell RNA-seq.
#'
#' from mouse cell atlas project
#'
#' @source <https://figshare.com/s/865e694ad06d5857db4b>
#' @family ref
#' @examples ref_MCA(metadata = TRUE)
"ref_MCA"

#' Atlas matrix of average gene expression aggregated from scRNA-seq data of mouse organisms
#' 
#' Data aggregated from NCBI Gene Expression Omnibus
#' 
#' @source <https://github.com/rnabioco/scRNA-seq-Cell-Ref-Matrix/blob/master/atlas/musMusculus/MouseAtlas.rds>
#' @family ref
#' @examples ref_mouse_atlas(metadata = TRUE) 
"ref_mouse_atlas"  