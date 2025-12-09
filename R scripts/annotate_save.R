# R scripts/annotate_save.R

annotate_clusters <- function(seu, mapping, label_col = "New_ident", unknown_label = "Unknown") {
  if (!inherits(seu, "Seurat")) stop("seu must be a Seurat object")
  if (is.null(mapping) || is.null(names(mapping))) {
    stop("mapping must be a named character vector: names are cluster IDs, values are labels")
  }
  
  # Use current identities (clusters) as the thing we map from
  cl <- as.character(Seurat::Idents(seu))
  
  # Map cluster -> label; unmapped become unknown_label
  mapped <- unname(mapping[cl])
  mapped[is.na(mapped)] <- unknown_label
  
  seu[[label_col]] <- mapped
  Seurat::Idents(seu) <- label_col
  seu
}

save_outputs <- function(seu,
                         markers,
                         top_markers,
                         out_dir = "output",
                         plots = list()) {
  if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)
  
  # Save objects/tables
  saveRDS(seu, file.path(out_dir, "seurat_obj.rds"))
  write.csv(markers, file.path(out_dir, "markers_all.csv"), row.names = FALSE)
  write.csv(top_markers, file.path(out_dir, "markers_top.csv"), row.names = FALSE)
  
  # Save plots (expects ggplot objects)
  if (length(plots) > 0) {
    for (nm in names(plots)) {
      p <- plots[[nm]]
      if (!is.null(p)) {
        ggplot2::ggsave(
          filename = file.path(out_dir, paste0(nm, ".png")),
          plot = p,
          width = 7,
          height = 5
        )
      }
    }
  }
  
  # Save session info for reproducibility
  writeLines(capture.output(sessionInfo()), file.path(out_dir, "sessionInfo.txt"))
  
  invisible(TRUE)
}
