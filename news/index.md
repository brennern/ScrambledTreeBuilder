# Changelog

## ScrambledTreeBuilder 1.3.0

- Expand
  [`recordClades()`](https://brennern.github.io/ScrambledTreeBuilder/reference/recordClades.md)
  to work on taxon tables (one genome per line).
- New
  [`removeAssemblies()`](https://brennern.github.io/ScrambledTreeBuilder/reference/removeAssemblies.md)
  function for on-the-fly filtering.

## ScrambledTreeBuilder 1.2.0

- Fix diagonal values in `Halo_PercentDiff`.
- Fix detection of YAML files.
- Make
  [`formatStats()`](https://brennern.github.io/ScrambledTreeBuilder/reference/formatStats.md)
  robust to the presence of character values.
- Stop dropping zero-valued columns in
  [`formatStats()`](https://brennern.github.io/ScrambledTreeBuilder/reference/formatStats.md).
- New
  [`residualBootstrapTree()`](https://brennern.github.io/ScrambledTreeBuilder/reference/residualBootstrapTree.md)
  function.
- [`makeMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/makeMatrix.md)
  now warns and returns `NULL` if a column is not found.
- [`makeValueTibble()`](https://brennern.github.io/ScrambledTreeBuilder/reference/makeValueTibble.md)
  returns the original tree if `NULL` is passed instead of a matrix.
- Added
  [`treeHeatMap()`](https://brennern.github.io/ScrambledTreeBuilder/reference/treeHeatMap.md)
  to visualise distance matrices with their values sorted like the
  branches of a phylogenetic tree, and optional focal clade
  highlighting.

## ScrambledTreeBuilder 1.1.0

- Add `oikData` `2025_02_25` that uses the experimental windowed
  scrambling index.

## ScrambledTreeBuilder 1.0.2

- Make
  [`formatStats()`](https://brennern.github.io/ScrambledTreeBuilder/reference/formatStats.md)
  more robust when computing `percent_aligned`

## ScrambledTreeBuilder 1.0.1

- Fix error messages in
  [`subMatrix()`](https://brennern.github.io/ScrambledTreeBuilder/reference/subMatrix.md)
  and document that it also works with focal clades.

## ScrambledTreeBuilder 1.0.0

- First release with semantic versioning.

## ScrambledTreeBuilder 0.0.0.9001

- Versions used before June 2025.
