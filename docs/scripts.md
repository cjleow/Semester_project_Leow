# Scripts

The pipeline logic is split into small scripts under `R scripts/` and orchestrated by `main.Rmd`.

## `main.Rmd`

- Orchestrates the pipeline
- Controls parameters via YAML `params`
- Optionally runs unit tests (`run_tests: true`)
- Produces the final analysis report (HTML)

## `R scripts/load_data.R`

Purpose:
- Load Monocle3 `cell_data_set` from a directory

Main function:
- `load_monocle_objects(dir_path)`

## `R scripts/convert.R`

Purpose:
- Convert Monocle3 object to Seurat object

Main function:
- `monocle_to_seurat(cds, project_name=...)`

## `R scripts/preprocess_cluster.R`

Purpose:
- Preprocessing and clustering steps

Main functions:
- `run_preprocess(seu, npcs=...)`
- `run_cluster_umap(seu, dims=..., resolution=...)`

## `R scripts/markers.R`

Purpose:
- Marker gene identification and selection of top markers

Main functions:
- `find_markers(seu, min_pct=..., logfc_threshold=...)`
- `top_markers(markers_df, n=...)`

## `R scripts/annotate_save.R`

Purpose:
- Cluster annotation and output saving

Main functions:
- `annotate_clusters(seu, mapping, label_col=...)`
- `save_outputs(seu, markers, top_markers, out_dir, plots=...)`
