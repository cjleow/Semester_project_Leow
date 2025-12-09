# Pipeline steps

This page describes what each pipeline step does, its inputs/outputs, and where it is implemented.

## Step 1 — Load Monocle3 object

**Goal:** load the dataset into R as a `cell_data_set`

- Input: `data/embryo_11dpf/cds_object.rds`
- Output: `cds` (Monocle3 object)

Implemented in:
- `R scripts/load_data.R` → `load_monocle_objects()`

## Step 2 — Convert to Seurat

**Goal:** convert Monocle3 object to a Seurat object for downstream analysis.

- Input: `cds` (`cell_data_set`)
- Output: `seurat_obj_11dpf` (Seurat object)

Implemented in:
- `R scripts/convert.R` → `monocle_to_seurat()`

## Step 3 — Preprocess + PCA

**Goal:** normalize and reduce dimensionality.

- SCTransform normalization
- PCA (Principal Component Analysis)

- Input: Seurat object with raw counts
- Output: Seurat object with `SCT` assay + PCA reduction

Implemented in:
- `R scripts/preprocess_cluster.R` → `run_preprocess()`

Key parameters in `main.Rmd`:
- `npcs` (number of PCs computed)
- `elbow_ndims` (how many PCs shown in elbow plot)

## Step 4 — Clustering + UMAP

**Goal:** identify clusters and visualize them.

- FindNeighbors (using selected PCs)
- FindClusters (resolution controls cluster granularity)
- RunUMAP for visualization

Outputs:
- Seurat object with `seurat_clusters`
- UMAP plot (cluster labels)

Implemented in:
- `R scripts/preprocess_cluster.R` → `run_cluster_umap()`

Key parameters:
- `dims_use` (number of PCs used)
- `resolution` (clustering resolution)

## Step 5 — Marker genes

**Goal:** find genes enriched in each cluster (cluster markers).

- Input: clustered Seurat object
- Output: `markers` (full table) and `top_markers` (top N per cluster)

Implemented in:
- `R scripts/markers.R` → `find_markers()`, `top_markers()`

Key parameters:
- `min_pct`
- `logfc_threshold`
- `top_n_markers`

## Step 6 — Cell type annotation

**Goal:** assign interpretable labels to clusters using a mapping.

- Input: Seurat clusters (0..9 in this dataset)
- Output: `New_ident` identity + annotated UMAP plot

Implemented in:
- `R scripts/annotate_save.R` → `annotate_clusters()`

Notes:
- This step uses a manual mapping: cluster ID → label.
- Unmapped clusters (if any) can be labeled as “Unknown”.

## Step 7 — Save outputs

**Goal:** save results to `output/` so the run is reproducible.

Saves:
- Seurat object (`.rds`)
- marker tables (`.csv`)
- plots (`.png`)
- `sessionInfo.txt`

Implemented in:
- `R scripts/annotate_save.R` → `save_outputs()`
