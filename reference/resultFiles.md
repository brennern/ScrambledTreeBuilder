# List YAML result files

Given a directory containing the YAML files output by the pipeline
<https://github.com/oist/plessy_nf_GenomicBreaks/>, prepare a vector
listing these files, possibly removing the ones matching keywords give
in a separate input file.

## Usage

``` r
resultFiles(dir, remove = "removedAssemblies.txt")
```

## Arguments

- dir:

  Directory containing the YAML files.

- remove:

  File containing patterns for element removal.

## Value

A character vector where elements are file paths and names are
identifiers to be used by the
[`formatStats()`](https://brennern.github.io/ScrambledTreeBuilder/reference/formatStats.md)
function.

## Note

The `remove` file is delimiter-separated, with the first column being a
pattern and the second an optional comment. It can be empty but must
exist.

## See also

Other Data load functions:
[`formatStats()`](https://brennern.github.io/ScrambledTreeBuilder/reference/formatStats.md)

## Author

Charles Plessy

## Examples

``` r
system.file("extdata/yaml", package = "ScrambledTreeBuilder") |> resultFiles()
#>                                                                               Halobacterium_litoreum___Halobacterium_noricense 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_litoreum___Halobacterium_noricense.yaml.bz2" 
#>                                                                               Halobacterium_litoreum___Halobacterium_salinarum 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_litoreum___Halobacterium_salinarum.yaml.bz2" 
#>                                                                                Halobacterium_litoreum___Haloferax_mediterranei 
#>   "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_litoreum___Haloferax_mediterranei.yaml.bz2" 
#>                                                                                    Halobacterium_litoreum___Haloferax_volcanii 
#>       "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_litoreum___Haloferax_volcanii.yaml.bz2" 
#>                                                                                 Halobacterium_litoreum___Salarchaeum_japonicum 
#>    "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_litoreum___Salarchaeum_japonicum.yaml.bz2" 
#>                                                                               Halobacterium_noricense___Halobacterium_litoreum 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_noricense___Halobacterium_litoreum.yaml.bz2" 
#>                                                                              Halobacterium_noricense___Halobacterium_salinarum 
#> "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_noricense___Halobacterium_salinarum.yaml.bz2" 
#>                                                                               Halobacterium_noricense___Haloferax_mediterranei 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_noricense___Haloferax_mediterranei.yaml.bz2" 
#>                                                                                   Halobacterium_noricense___Haloferax_volcanii 
#>      "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_noricense___Haloferax_volcanii.yaml.bz2" 
#>                                                                                Halobacterium_noricense___Salarchaeum_japonicum 
#>   "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_noricense___Salarchaeum_japonicum.yaml.bz2" 
#>                                                                               Halobacterium_salinarum___Halobacterium_litoreum 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_salinarum___Halobacterium_litoreum.yaml.bz2" 
#>                                                                              Halobacterium_salinarum___Halobacterium_noricense 
#> "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_salinarum___Halobacterium_noricense.yaml.bz2" 
#>                                                                               Halobacterium_salinarum___Haloferax_mediterranei 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_salinarum___Haloferax_mediterranei.yaml.bz2" 
#>                                                                                   Halobacterium_salinarum___Haloferax_volcanii 
#>      "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_salinarum___Haloferax_volcanii.yaml.bz2" 
#>                                                                                Halobacterium_salinarum___Salarchaeum_japonicum 
#>   "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Halobacterium_salinarum___Salarchaeum_japonicum.yaml.bz2" 
#>                                                                                Haloferax_mediterranei___Halobacterium_litoreum 
#>   "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_mediterranei___Halobacterium_litoreum.yaml.bz2" 
#>                                                                               Haloferax_mediterranei___Halobacterium_noricense 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_mediterranei___Halobacterium_noricense.yaml.bz2" 
#>                                                                               Haloferax_mediterranei___Halobacterium_salinarum 
#>  "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_mediterranei___Halobacterium_salinarum.yaml.bz2" 
#>                                                                                    Haloferax_mediterranei___Haloferax_volcanii 
#>       "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_mediterranei___Haloferax_volcanii.yaml.bz2" 
#>                                                                                 Haloferax_mediterranei___Salarchaeum_japonicum 
#>    "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_mediterranei___Salarchaeum_japonicum.yaml.bz2" 
#>                                                                                    Haloferax_volcanii___Halobacterium_litoreum 
#>       "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_volcanii___Halobacterium_litoreum.yaml.bz2" 
#>                                                                                   Haloferax_volcanii___Halobacterium_noricense 
#>      "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_volcanii___Halobacterium_noricense.yaml.bz2" 
#>                                                                                   Haloferax_volcanii___Halobacterium_salinarum 
#>      "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_volcanii___Halobacterium_salinarum.yaml.bz2" 
#>                                                                                    Haloferax_volcanii___Haloferax_mediterranei 
#>       "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_volcanii___Haloferax_mediterranei.yaml.bz2" 
#>                                                                                     Haloferax_volcanii___Salarchaeum_japonicum 
#>        "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Haloferax_volcanii___Salarchaeum_japonicum.yaml.bz2" 
#>                                                                                 Salarchaeum_japonicum___Halobacterium_litoreum 
#>    "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Salarchaeum_japonicum___Halobacterium_litoreum.yaml.bz2" 
#>                                                                                Salarchaeum_japonicum___Halobacterium_noricense 
#>   "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Salarchaeum_japonicum___Halobacterium_noricense.yaml.bz2" 
#>                                                                                Salarchaeum_japonicum___Halobacterium_salinarum 
#>   "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Salarchaeum_japonicum___Halobacterium_salinarum.yaml.bz2" 
#>                                                                                 Salarchaeum_japonicum___Haloferax_mediterranei 
#>    "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Salarchaeum_japonicum___Haloferax_mediterranei.yaml.bz2" 
#>                                                                                     Salarchaeum_japonicum___Haloferax_volcanii 
#>        "/home/runner/work/_temp/Library/ScrambledTreeBuilder/extdata/yaml/Salarchaeum_japonicum___Haloferax_volcanii.yaml.bz2" 
```
