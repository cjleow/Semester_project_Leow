test_that("monocle_to_seurat returns a Seurat object", {
  skip_if_not_installed("monocle3")
  skip_if_not_installed("Seurat")
  
  expr <- matrix(rpois(40, 2), nrow = 10)
  colnames(expr) <- paste0("cell", 1:ncol(expr))
  rownames(expr) <- paste0("gene", 1:nrow(expr))
  
  cell_md <- data.frame(cell = colnames(expr), row.names = colnames(expr))
  gene_md <- data.frame(gene_short_name = rownames(expr), row.names = rownames(expr))
  
  cds <- monocle3::new_cell_data_set(expr, cell_metadata = cell_md, gene_metadata = gene_md)
  seu <- monocle_to_seurat(cds, project_name = "test")
  
  expect_true(inherits(seu, "Seurat"))
  expect_equal(ncol(seu), ncol(expr))
})
