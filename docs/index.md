# Welcome to my single-cell RNA-seq pipeline documentation page

The goal of this pipeline is to streamline single-cell RNA-seq for my dissertation projects and provide documentation in each step for reproducibility.

Input: 
The input for this pipeline is a monocle 3 object commonly used for scRNA-seq analysis. If you are working with raw reads, this website can be helpful: https://www.sc-best-practices.org/introduction/raw_data_processing.html

Step 1 -3: obtain data
1. receive the experimental single-cell dataset
2. Download the data as a Monocle3 object
3. Transfer and store he data on MSU HPCC (high performance computing cluster)

Step 4: prepare for scRNA analysis
1. The count data is extracted from monocle 3 obj and stored in a variable named count_data
2. The metadata is extracted from monocle 3 obj and stored in a variable named metadata

Step 5: the main part of the analysis
Most of the functions here are included in R package Seurat, detailed resources can be found here: https://cole-trapnell-lab.github.io/monocle3/docs/getting_started/
Specific parameters may be used for different experiments
1. create Seurat object
2. Normalize and scale data
3. Dimentionality reduction
4. Batch correction (optional)
5. Find neighbors and clusters
6. visualization (UMAP or t-SNE)
7. Identify marker genes

Step 6: save outputs
The most important outputs from step 5 are 
1. Differential expressed gene tables 
2. UMAP plots
3. PCA embeddings 
All of these are saved on HPCC

Step 7: trajectory or pseudotime analysis
The PCA embeddings can be used for cross-species alignment and comparison. Trajectory analysis can be done for different timepoints of scRNA data. 