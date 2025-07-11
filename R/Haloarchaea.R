#' @name Haloarchaea
#'
#' @title Example Haloarchaea data objects
#'
#' @description Concept examples of Haloarchaea comparisons for test and
#' demonstration purposes.
#'
#' @details This test dataset is derived from genome alignments produced
#' by a beta version of the <https://nf-co.re/pairgenomealign> pipeline.
#'
#' @format `Halo_DF` is a `data.frame` containing summary statistics for pairs
#' of Haloarchaea genome comparisons, `Halo_PercentDiff` is a `matrix` of
#' pairwise nucleotide percent differences, `Halo_Tree` a `tbl_tree` object
#' computed from this matrix, in which percent difference and scrambling
#' index averages were projected on the internal nodes representing most
#' recent common ancestors. Finallly `Halo_FocalClades` is a `FocalCladeList`
#' object highlighting the `Halobacterium` and `Haloferax` genuses.
#'
#' @author Charles Plessy
#'
#' @aliases Halo_DF Halo_PercentDiff Halo_FocalClades Halo_Tree
#'
#' @family Structural variants
#' @family Lazy-loaded data
#'
#' @examples
#' Halo_DF
#' Halo_PercentDiff
#' Halo_Tree
#' Halo_FocalClades
#'
NULL
