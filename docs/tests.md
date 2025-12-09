# Tests

This project uses R package **testthat** to test key functions in the pipeline.

## Where tests live
Tests are located in:

`tests/testthat/`

Example files:
- `test-load_data.R`
- `test-convert.R`
- `test-annotate_save.R`
(Additional tests can be added as the workflow grows.)

## What is tested
The tests are lightweight and designed to run quickly. They verify that:

- Loading a `cell_data_set` from `cds_object.rds` works
- Converting Monocle3 → Seurat produces a valid Seurat object
- Annotation adds the expected metadata column / identity
- Saving outputs creates expected files

## How to run tests

### Run tests directly in R

```r
testthat::test_dir("tests/testthat", reporter = "summary")
