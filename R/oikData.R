#' @name oikData
#'
#' @title Oikopleura data
#'
#' @description _Oikopleura_ data points to overlay on nucleotide distance /
#' scrambling index plots.
#'
#' @details This test dataset is derived from genome alignments produced
#' by a beta version of the <https://nf-co.re/pairgenomealign> pipeline.
#'
#'  - `2025_02_17` 6 distances using the `RY128` seed.
#'  - `2025_02_25` 10 distances using the `RY4` seed.
#'  - `2025_02_25` 10 distances (5 windows per sequence feature) using the
#'     `MAM8` seed and the `2.1~beta` pipeline.
#'
#' @format List of tibbles.  The name of each tibble is just a time stamp.
#'
#' @author Charles Plessy
#'
#' @family Lazy-loaded data
#'
#' @examples
#' oikData
"oikData"
