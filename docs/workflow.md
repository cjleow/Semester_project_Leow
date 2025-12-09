# Workflow

This project is a reproducible single-cell RNA-seq (scRNA-seq) analysis workflow built in **R** using:

- **monocle3** for the input data format (`cell_data_set`)
- **Seurat** for normalization, dimensionality reduction, clustering, marker detection, and visualization
- **testthat** for unit tests

## Acyclic data flow

The workflow is **acyclic** (directed acyclic graph / DAG): each step takes inputs and produces outputs that are used downstream, without looping back to earlier steps.

High-level flow:

1. **Input data** (Monocle3 `cell_data_set`)  
2. **Convert** to Seurat object  
3. **Preprocess** (SCTransform, PCA)  
4. **Cluster + UMAP**  
5. **Marker genes**  
6. **Cell type annotation** (mapping clusters → labels)  
7. **Save outputs** (plots, tables, objects, session info)

## Inputs and outputs

- **Input:** `data/embryo_11dpf/` (contains `cds_object.rds`)
- **Outputs:** `output/` (CSV marker tables, PNG plots, Seurat object `.rds`, session info)
- **Documentation site:** `docs/` rendered by MkDocs
- **Tests:** `tests/testthat/`
