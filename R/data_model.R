#' STB Data Model: Core Objects and Relationships
#'
#' @title Core Data Objects and Their Relationships
#'
#' @description
#' This manual describes the core data objects used throughout the STB
#' framework, their expected structure, and the relationships that govern how
#' data flow through the analytical pipeline.
#'
#' The STB data model is intentionally declarative: YAML inputs define intent
#' and configuration, while derived objects capture computational structure.
#' This separation supports reproducibility, extensibility, and method
#' substitution without altering conceptual semantics.
#'
#' @details
#' ## Model Overview
#'
#' The STB data model is organized into three conceptual layers:
#'
#' 1. **YAML input specifications**
#' 2. **Derived core data objects**
#' 3. **Summary and reporting outputs**
#'
#' These layers are loosely coupled: YAML inputs remain immutable, while
#' downstream objects may be recomputed or replaced as analytical strategies
#' evolve.
#'
#' ## YAML Inputs
#'
#' All analyses begin from one or more YAML input files defining data sources,
#' metadata, and processing parameters. Each YAML input is expected to contain
#' the following high‑level fields:
#'
#' - **`InputType`**  
#'   A scalar character value indicating the semantic role of the input
#'   (e.g. configuration, experimental data, reference data).
#'
#' - **`Metadata`**  
#'   A named list describing dataset provenance, such as collection date,
#'   source, experimental context, or versioning information.
#'
#' - **`Parameters`**  
#'   A named list of parameters controlling downstream processing, including
#'   algorithmic choices, distance metrics, and thresholds.
#'
#' YAML inputs are treated as declarative specifications and are not mutated
#' during analysis.
#'
#' ## Core Data Objects
#'
#' ### Distance Matrix
#'
#' A distance matrix represents pairwise distances between data points derived
#' from YAML-defined inputs and parameters.
#'
#' **Structure**
#'
#' - **Rows** – Identifiers corresponding to individual data points  
#' - **Columns** – Pairwise distance values computed under a defined metric
#'
#' Distance matrices form the quantitative substrate for clustering and
#' hierarchical inference.
#'
#' ### Tree Objects
#'
#' Tree objects encode hierarchical relationships inferred from distance
#' matrices, typically via clustering or agglomerative algorithms.
#'
#' **Key components**
#'
#' - **Nodes** – Leaves or internal nodes representing data points or clusters  
#' - **Edges** – Connections encoding hierarchical structure and ordering
#'
#' Tree objects capture structure rather than raw measurements and are commonly
#' used for traversal, annotation, and visualization.
#'
#' ## Functions
#'
#' ### `formatStats`
#'
#' The `formatStats` function produces standardized, human‑readable statistical
#' summaries derived from core data objects.
#'
#' **Conceptual flow**
#'
#' 1. **Input** – Raw statistics computed from distance matrices, tree objects,
#'    or both  
#' 2. **Processing** – Transformation and formatting into a consistent schema  
#' 3. **Output** – Structured summaries suitable for reporting or interpretation
#'
#' ## Relationships Between Objects
#'
#' Distance matrices are derived directly from YAML inputs and serve as inputs
#' to clustering procedures that generate tree objects. Statistical summaries
#' returned by `formatStats` may draw on properties of both distance matrices
#' and tree objects, enabling integrated quantitative and structural insight
#' into the modeled system.
#'
#' @name STB_data_model
#' @md
"_PACKAGE"
