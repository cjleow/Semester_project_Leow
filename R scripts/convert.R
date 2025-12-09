# R scripts/convert.R

monocle_to_seurat <- function(cds, project_name = "scRNAseq_project") {
  if (!inherits(cds, "cell_data_set")) {
    stop("cds must be a monocle3 cell_data_set")
  }
  
  # Pull the counts matrix from the assays
  counts_mat <- SummarizedExperiment::assay(cds, "counts")
  
  # Pull cell metadata
  meta <- as.data.frame(SummarizedExperiment::colData(cds))
  
  seu <- Seurat::CreateSeuratObject(
    counts = counts_mat,
    meta.data = meta,
    project = project_name
  )
  
  seu
}
