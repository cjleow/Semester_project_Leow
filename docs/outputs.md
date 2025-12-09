# Outputs

All results from the pipeline are saved to the output directory specified in `main.Rmd`:

- `params$out_dir` (default: `output/`)

This makes the workflow reproducible because you can re-run the pipeline and compare the saved artifacts.

---

## Output directory structure

After a successful run, you should see files like:

- `output/seurat_obj.rds`  
  Final Seurat object after preprocessing, clustering, and (if enabled) annotation.

- `output/markers_all.csv`  
  Full marker table from `Seurat::FindAllMarkers()`.

- `output/markers_top.csv`  
  Top N marker genes per cluster (N controlled by `params$top_n_markers`).

- `output/elbow.png`  
  Elbow plot for PCA variance (helps choose number of PCs).

- `output/umap_clusters.png`  
  UMAP plot colored by Seurat clusters.

- `output/sessionInfo.txt`  
  The R session information (R version + package versions) used for the run.

> Note: If you add more plots (e.g., annotated UMAP), they can be added to the `plots = list(...)` argument in `save_outputs()`.

---

## How to verify the run worked

1. **Plots exist and look reasonable**
   - `elbow.png` shows a clear “elbow” or diminishing variance after some PCs.
   - `umap_clusters.png` shows separated clusters (not all cells overlapping).

2. **Marker tables are non-empty**
   - `markers_all.csv` should contain many rows (marker genes across clusters).
   - `markers_top.csv` should contain `top_n_markers × (#clusters)` rows (approximately).

3. **The Seurat object can be reloaded**
   In R:
   ```r
   seu <- readRDS("output/seurat_obj.rds")
   seu
