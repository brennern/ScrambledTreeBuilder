
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
these files into a dataframe in R, you may use the `formatStats()`
function. Extract your .yaml files from their respective directory and
store the information under the variable `yamlFiles`.

``` r
library(ScrambledTreeBuilder)

resultsDir <- system.file("extdata/PairwiseComparisons", package = "ScrambledTreeBuilder")
yamlFileData <- list.files(resultsDir, pattern = "*.yaml.bz2", full.names = TRUE)
names(yamlFileData) <- yamlFileData |> basename() |> sub(pat = ".yaml.bz2", rep="")

exDataFrame <- formatStats(yamlFileData)
```

To build the phylogenetic trees, your data frame will need to be
transformed into a matrix. The function `makeMatrix()` will accomplish
this.

``` r
valuesToBuildTheTree <- "percent_identity_global"
treeMatrix <- makeMatrix(exDataFrame, valuesToBuildTheTree, 100, 50)
valuesToPlaceOnLabels <- "index_avg_strandRand"
valueMatrix <- makeMatrix(exDataFrame, valuesToPlaceOnLabels, 1, 0.5)
```

Then, in order to plot the percent identity and strand randomisation
index scores on the tree, you will need to extract the tree data in a
tibble and utilize the functions `makeValueTibble()`.

``` r
HClust <- hclust(dist(treeMatrix), method = "complete")
Tibble <- tidytree::as_tibble(tidytree::as.phylo(HClust))
tibbleWithValue <- makeValueTibble(Tibble, valueMatrix)
tibbleWithMultipleValues <- makeMultiValueTibble(Tibble, exDataFrame, colsToSelect = c("index_avg_strandRand", "percent_identity_global"))
```

Finally, to visualize your phylogenetic tree, you can utilize the
`visualizeTree()` function by inputting your tibble data containing your
desired variable.

``` r
SingleValueTree <- visualizeTree(tibbleWithValue, tibbleWithValue$value)

SingleValueTree + 
  ggplot2::ggtitle(paste("Tree built with", valuesToBuildTheTree, "and labelled with", valuesToPlaceOnLabels)) + 
  viridis::scale_color_viridis(name = valuesToPlaceOnLabels) +
  ggtree::geom_hilight(node = 8, fill = "lightblue1", alpha = .2, type = "gradient", gradient.direction = 'tr') +
  ggtree::geom_hilight(node = 9, fill = "pink", alpha = .2, type = "gradient", gradient.direction = 'tr')
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

``` r
MultiValueTree <- visualizeTree(tibbleWithMultipleValues, tibbleWithMultipleValues$index_avg_strandRand, ynudge = 0.35)
#> Scale for y is already present.
#> Adding another scale for y, which will replace the existing scale.

MultiValueTree +
  ggplot2::ggtitle("Tree labeled with strand randomisation index and percent identity (built with percent identity)") +
  viridis::scale_color_viridis(name = "Strand Randomisation Index") +
  ggnewscale::new_scale_colour() +
  ggtree::geom_label(ggtree::aes(label=round(percent_identity_global, digits = 3), color = percent_identity_global), label.size = 0.25, size = 3, na.rm = TRUE, label.padding = ggtree::unit(0.15, "lines"), nudge_y = -0.35) +
  viridis::scale_color_viridis(option = "magma", name = "Percent Identity")
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />
