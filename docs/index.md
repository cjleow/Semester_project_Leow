# Single-cell RNA-seq workflow documentation (CMSE Reproducible Computational Workflow)

This site documents my reproducible single-cell RNA-seq (scRNA-seq) workflow for dissertation projects. The analysis is implemented in **R** using **Monocle3** for the input data format and **Seurat** for downstream analysis (normalization, clustering, marker genes, and visualization).

If you are starting from raw reads instead of a processed object, see:  
https://www.sc-best-practices.org/introduction/raw_data_processing.html

Most of the functions here are included in R package Seurat, detailed resources can be found here: https://cole-trapnell-lab.github.io/monocle3/docs/getting_started/

---

## Project structure (what’s in this repository)

- `main.Rmd` — the main reproducible report that runs the pipeline end-to-end
- `R scripts/` — modular R scripts for each pipeline stage (load, convert, preprocess, markers, annotation, saving)
- `data/embryo_11dpf/` — input directory containing `cds_object.rds` (Monocle3 `cell_data_set`)
- `output/` — results saved by the pipeline (tables, plots, objects, session info)
- `tests/testthat/` — unit tests for key pipeline functions (run with testthat)
- `docs/` — MkDocs documentation pages (this website)

---

## How to run the workflow

### Render the analysis report (recommended)
From the project root in R:

```r
rmarkdown::render("main.Rmd")
