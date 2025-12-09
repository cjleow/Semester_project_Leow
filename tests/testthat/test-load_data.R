test_that("load_monocle_objects loads cds_object.rds from a directory", {
  skip_if_not_installed("monocle3")
  
  td <- tempdir()
  d <- file.path(td, "embryo_11dpf_test")
  dir.create(d, showWarnings = FALSE)
  
  expr <- matrix(rpois(50, lambda = 2), nrow = 10)
  colnames(expr) <- paste0("cell", 1:ncol(expr))
  rownames(expr) <- paste0("gene", 1:nrow(expr))
  
  cell_md <- data.frame(cell = colnames(expr), row.names = colnames(expr))
  gene_md <- data.frame(gene_short_name = rownames(expr), row.names = rownames(expr))
  
  cds <- monocle3::new_cell_data_set(expr, cell_metadata = cell_md, gene_metadata = gene_md)
  saveRDS(cds, file.path(d, "cds_object.rds"))
  
  out <- load_monocle_objects(d)
  expect_true(inherits(out, "cell_data_set"))
})
