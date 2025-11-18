# ScrambledTreeBuilder dev

* `subTree()` now outputs trees with proper `isTip` and `y` columns.

# ScrambledTreeBuilder 1.3.0

* Expand `recordClades()` to work on taxon tables (one genome per line).
* New `removeAssemblies()` function for on-the-fly filtering.

# ScrambledTreeBuilder 1.2.0

* Fix diagonal values in `Halo_PercentDiff`.
* Fix detection of YAML files.
* Make `formatStats()` robust to the presence of character values.
* Stop dropping zero-valued columns in `formatStats()`.
* New `residualBootstrapTree()` function.
* `makeMatrix()` now warns and returns `NULL` if a column is not found.
* `makeValueTibble()` returns the original tree if `NULL` is passed instead of
   a matrix.
* Added `treeHeatMap()` to visualise distance matrices with their values sorted
  like the branches of a phylogenetic tree, and optional focal clade
  highlighting.

# ScrambledTreeBuilder 1.1.0

* Add `oikData` `2025_02_25` that uses the experimental windowed scrambling
  index.

# ScrambledTreeBuilder 1.0.2

* Make `formatStats()` more robust when computing `percent_aligned`

# ScrambledTreeBuilder 1.0.1

* Fix error messages in `subMatrix()` and document that it also works with
  focal clades.

# ScrambledTreeBuilder 1.0.0

* First release with semantic versioning.

# ScrambledTreeBuilder 0.0.0.9001

* Versions used before June 2025.
