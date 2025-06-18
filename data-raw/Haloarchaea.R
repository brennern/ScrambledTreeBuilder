## code to prepare `Haloarchaea` data objects goes here

Halo_DF <- system.file("extdata/yaml", package = "ScrambledTreeBuilder") |>
  list.files(pattern = "*.yaml.bz2", full.names = TRUE) |>
  purrr::set_names(~ .x |> basename()  |> sub(pat = ".yaml.bz2", rep="")) |>
  formatStats()
usethis::use_data(Halo_DF, overwrite = TRUE)

Halo_PercentDiff <- 100 - makeMatrix(Halo_DF, "percent_identity_global", 100, 50)
usethis::use_data(Halo_PercentDiff, overwrite = TRUE)

Halo_ScramblIdx <- 1 - makeMatrix(Halo_DF, "index_avg_strandRand", 1, 0.5)

Halo_Tree <- makeTidyTree((Halo_PercentDiff/2 + t(Halo_PercentDiff)/2)) |>
  makeValueTibble(Halo_PercentDiff, colname = "Percent_difference")     |>
  makeValueTibble(Halo_ScramblIdx,  colname = "Scrambling_index")
usethis::use_data(Halo_Tree, overwrite = TRUE)

Halo_bacterium   <- focalClade(Halo_Tree, "Halobacterium_noricense", "Halobacterium_salinarum", "blue",   "Halobacterium genus")
Halo_ferax       <- focalClade(Halo_Tree, "Haloferax_mediterranei",  "Haloferax_volcanii",      "green3", "Haloferax genus")
Halo_FocalClades <- FocalCladeList(Halobacterium = Halo_bacterium, Halofera = Halo_ferax)
usethis::use_data(Halo_FocalClades, overwrite = TRUE)
