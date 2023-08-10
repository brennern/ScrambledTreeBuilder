
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ScrambledTreeBuilder

<!-- badges: start -->
<!-- badges: end -->

The goal of ScrambledTreeBuilder is to allow users to conveniently
produce phylogenetic trees between species with the purpose of studying
genome scrambling.

## Installation

You can install the development version of ScrambledTreeBuilder from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("brennern/ScrambledTreeBuilder")
```

## Usage

After performing an All Vs. All genome comparison between dozens of
species, you may have .yaml files as the output. In order to convert
these files into a dataframe in R, you may use the
`ScrambledTreeBuilder::formatStats()` function. Extract your .yaml files
from their respective directory and store the information under the
variable `yamlFiles`.

``` r
library(ScrambledTreeBuilder)

params <- list()
params$resultsDir <- '/flash/LuscombeU/noa/RPackageData'
yamlFileData <- list.files(params$resultsDir, pattern = "*.yaml", full.names = TRUE)
names(yamlFileData) <- yamlFileData |> basename() |> sub(pat = ".yaml", rep="")

exDataFrame <- ScrambledTreeBuilder::formatStats(yamlFileData)
```

To build the phylogenetic trees, your data frame will need to be
tranformed into a matrix. The function
`ScrambledTreeBuilder::makeMatrix()` will accomplish this.

``` r
treeMatrix <- ScrambledTreeBuilder::makeMatrix(exDataFrame, "percent_identity_global", 100, 50)
valueMatrix <- ScrambledTreeBuilder::makeMatrix(exDataFrame, "index_avg_strandRand", 100, 50)
```

Then, in order to plot the percent identity and strand randomisation
index scores on the tree, you will need to extract the tree data in a
tibble and utilize the functions
`ScrambledTreeBuilder::makeValueTibble()`.

``` r
HClust <- hclust(dist(treeMatrix), method = "complete")
Tibble <- tidytree::as_tibble(tidytree::as.phylo(HClust))
tibbleWithValue <- ScrambledTreeBuilder::makeValueTibble(Tibble, valueMatrix)
```
