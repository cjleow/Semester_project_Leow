# R scripts/markers.R

find_markers <- function(seu, min_pct = 0.25, logfc_threshold = 0.25, only_pos = TRUE) {
  if (!inherits(seu, "Seurat")) stop("seu must be a Seurat object")
  
  Seurat::FindAllMarkers(
    object = seu,
    only.pos = only_pos,
    min.pct = min_pct,
    logfc.threshold = logfc_threshold
  )
}

top_markers <- function(markers_df, n = 50) {
  if (!is.data.frame(markers_df)) stop("markers_df must be a data.frame")
  if (!all(c("cluster", "avg_log2FC") %in% names(markers_df))) {
    stop("markers_df must include columns: cluster, avg_log2FC")
  }
  
  dplyr::as_tibble(markers_df) |>
    dplyr::group_by(.data$cluster) |>
    dplyr::slice_max(order_by = .data$avg_log2FC, n = n, with_ties = FALSE) |>
    dplyr::ungroup()
}
