# R scripts/load_data.R

# Load a monocle3 object (cell_data_set) stored in a directory.
# Expected: <dir_path>/cds_object.rds
load_monocle_objects <- function(dir_path) {
  if (!dir.exists(dir_path)) stop("Directory does not exist: ", dir_path)
  
  cds_path <- file.path(dir_path, "cds_object.rds")
  if (!file.exists(cds_path)) stop("Expected file not found: ", cds_path)
  
  obj <- readRDS(cds_path)
  if (!inherits(obj, "cell_data_set")) {
    stop("Loaded object is not a monocle3 cell_data_set. Got class: ",
         paste(class(obj), collapse = ", "))
  }
  obj
}

# If you ever want to load directly from a single .rds file:
load_monocle_object <- function(path_rds) {
  if (!file.exists(path_rds)) stop("File does not exist: ", path_rds)
  
  obj <- readRDS(path_rds)
  if (!inherits(obj, "cell_data_set")) {
    stop("Loaded object is not a monocle3 cell_data_set. Got class: ",
         paste(class(obj), collapse = ", "))
  }
  obj
}
