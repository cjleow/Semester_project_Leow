test_that("annotate_clusters adds label column and sets identities", {
  skip_if_not_installed("Seurat")
  
  m <- matrix(rpois(30, 2), nrow = 10)
  colnames(m) <- paste0("cell", 1:ncol(m))
  rownames(m) <- paste0("gene", 1:nrow(m))
  seu <- Seurat::CreateSeuratObject(m)
  
  # Create fake cluster identities "0" and "1"
  Seurat::Idents(seu) <- factor(rep(c("0", "1"), length.out = ncol(seu)))
  
  mapping <- c("0" = "TypeA", "1" = "TypeB")
  seu2 <- annotate_clusters(seu, mapping = mapping, label_col = "New_ident")
  
  expect_true("New_ident" %in% colnames(seu2@meta.data))
  expect_true(all(levels(Seurat::Idents(seu2)) %in% c("TypeA", "TypeB", "Unknown")))
})

test_that("save_outputs writes expected files", {
  skip_if_not_installed("Seurat")
  
  m <- matrix(rpois(30, 2), nrow = 10)
  colnames(m) <- paste0("cell", 1:ncol(m))
  rownames(m) <- paste0("gene", 1:nrow(m))
  seu <- Seurat::CreateSeuratObject(m)
  
  markers <- data.frame(cluster = 0, avg_log2FC = 1, gene = "gene1")
  top_markers <- markers
  
  out_dir <- file.path(tempdir(), "out_test")
  dir.create(out_dir, showWarnings = FALSE)
  
  save_outputs(
    seu = seu,
    markers = markers,
    top_markers = top_markers,
    out_dir = out_dir,
    plots = list()
  )
  
  expect_true(file.exists(file.path(out_dir, "seurat_obj.rds")))
  expect_true(file.exists(file.path(out_dir, "markers_all.csv")))
  expect_true(file.exists(file.path(out_dir, "markers_top.csv")))
  expect_true(file.exists(file.path(out_dir, "sessionInfo.txt")))
})
