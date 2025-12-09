# R scripts/preprocess_cluster.R

run_preprocess <- function(seu, npcs = 30) {
  if (!inherits(seu, "Seurat")) stop("seu must be a Seurat object")
  if (!is.numeric(npcs) || length(npcs) != 1) stop("npcs must be a single number")
  
  seu <- Seurat::SCTransform(seu, verbose = FALSE)
  seu <- Seurat::RunPCA(seu, npcs = npcs, verbose = FALSE)
  
  seu
}

run_cluster_umap <- function(seu, dims = 1:20, resolution = 1.0) {
  if (!inherits(seu, "Seurat")) stop("seu must be a Seurat object")
  if (length(dims) < 2) stop("dims must include at least 2 PCs")
  if (!is.numeric(resolution) || length(resolution) != 1) stop("resolution must be a single number")
  
  seu <- Seurat::FindNeighbors(seu, dims = dims, verbose = FALSE)
  seu <- Seurat::FindClusters(seu, resolution = resolution, verbose = FALSE)
  seu <- Seurat::RunUMAP(seu, dims = dims, verbose = FALSE)
  
  seu
}
