## code to prepare `Haloarchaea` data objects goes here

Halo_DF <- system.file("extdata/yaml", package = "ScrambledTreeBuilder") |>
  resultFiles() |>  formatStats()

Halo_PercentDiff <- makeMatrix(Halo_DF, "percent_difference_global", 0)
usethis::use_data(Halo_PercentDiff, overwrite = TRUE)

Halo_ScramblIdx <- makeMatrix(Halo_DF, "index_avg_strandDiscord", 1)

Halo_Tree <- makeTidyTree((Halo_PercentDiff/2 + t(Halo_PercentDiff)/2)) |>
  makeValueTibble(Halo_PercentDiff, colname = "Percent_difference")     |>
  makeValueTibble(Halo_ScramblIdx,  colname = "Scrambling_index")
usethis::use_data(Halo_Tree, overwrite = TRUE)

Halo_DF <- recordAncestor(Halo_DF, Halo_Tree)
Halo_DF <- recordClades  (Halo_DF, Halo_FocalClades)
usethis::use_data(Halo_DF, overwrite = TRUE)

Halo_bacterium   <- focalClade(Halo_Tree, "Halobacterium_noricense", "Halobacterium_salinarum", "blue",   "Halobacterium genus")
Halo_ferax       <- focalClade(Halo_Tree, "Haloferax_mediterranei",  "Haloferax_volcanii",      "green3", "Haloferax genus")
Halo_FocalClades <- FocalCladeList(Halobacterium = Halo_bacterium, Haloferax = Halo_ferax)
usethis::use_data(Halo_FocalClades, overwrite = TRUE)
