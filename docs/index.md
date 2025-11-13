# Welcome to my single-cell RNA-seq pipeline documentation page

The goal of this pipeline is to streamline single-cell RNA-seq for my dissertation projects and provide documentation in each step for reproducibility.

Input: 
The input for this pipeline is a monocle 3 object commonly used for scRNA-seq analysis. If you are working with raw reads, this website can be helpful: https://www.sc-best-practices.org/introduction/raw_data_processing.html

Step 1 -3: obtain data
The data is downloaded and stored on MSU HPCC

Step 4: prepare for scRNA analysis
The count data is extracted from monocle 3 obj and stored in a variable named count_data
The metadata is extracted from monocle 3 obj and stored in a variable named metadata

Step 5: the main part of the analysis
Most of the functions here are included in R package Seurat, detailed resources can be found here: https://cole-trapnell-lab.github.io/monocle3/docs/getting_started/
Specific parameters may be used for different experiments

Step 6: save outputs
The most important outputs from step 5 are differential expressed gene tables, UMAP plots, and PCA embeddings, all of these are saved on HPCC

Step 7: trajectory or pseudotime analysis
The PCA embeddings can be used for cross-species alignment and comparison. Trajectory analysis can be done for different timepoints of scRNA data. 