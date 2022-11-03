#' clustifyrdatahub: reference scRNA-seq data for clustifyr
#'
#' The clustifyrdatahub package provides access to the summarized reference 
#' count matrix data from multiple datasets used in the clustifyr manuscript 
#' and tutorial. They are provided for future users of clustifyr, for
#' automated cell type classification of scRNA-seq experiments.
#'
#' Available datasets:
#'
#' + Mouse Cell Atlas
#' - [ref_MCA()]
#' + Tabula Muris (10X)
#' - [ref_tabula_muris_drop()]
#' + Tabula Muris (SmartSeq2)
#' - [ref_tabula_muris_facs()]
#' + Mouse RNA-seq from 28 cell types
#' - [ref_mouse.rnaseq()]
#' + Mouse Organogenesis Cell Atlas (main cell types)
#' - [ref_moca_main()]
#' + Mouse sorted immune cells
#' - [ref_immgen()]
#' + Human hematopoietic cell microarray
#' - [ref_hema_microarray()]
#' + Human cortex development scRNA-seq
#' - [ref_cortex_dev()]
#' + Human pancreatic cell scRNA-seq (inDrop)
#' - [ref_pan_indrop()]
#' + Human pancreatic cell scRNA-seq (SmartSeq2)
#' - [ref_pan_smartseq2()]
#' @docType package
#' @keywords internal
#' @name clustifyrdatahub
NULL

#' @importFrom ExperimentHub ExperimentHub
NULL