# Inputs

## Required input directory

This pipeline expects a directory containing a Monocle3 object:

- `data/embryo_11dpf/`
  - `cds_object.rds` (required): Monocle3 `cell_data_set`
  - `file_index.rds` (optional): not used by the pipeline, included with dataset packaging

The loader function reads:

`data/embryo_11dpf/cds_object.rds`

## What is a `cell_data_set`?

A `cell_data_set` (CDS) is Monocle3’s main object for single-cell data. It contains:

- a gene-by-cell count matrix (assay: `counts`)
- cell metadata (e.g., sample, embryo, UMI counts)
- optional reduced dimensions (PCA/UMAP) stored in the object

## Input assumptions

- The CDS contains an assay named `counts`
- Cell metadata is stored in `colData(cds)`
- Genes are stored as rows (features); cells are columns
