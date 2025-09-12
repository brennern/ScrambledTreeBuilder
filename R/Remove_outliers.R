#' Remove outliers based on thresholds or quartiles
#'
#' This function removes outliers (pairs with high identity but low total aligned genome) from the results dataframe based on the specified thresholds for percent identity and alignment length.
#'
#' @param df A dataframe containing alignment results data.
#' @param percent_identity_col The column name for the percent identity values.
#' @param alignment_length_col The column name for the normalized alignment length values.
#' @param percent_identity_threshold The threshold for percent identity (optional).
#' @param alignment_length_threshold The threshold for alignment length (optional).
#'
#' @return A new dataframe with the outliers removed.
#' @author Anika Mittal
#'
#' @importFrom stats quantile
#'
#' @examples
#' remove_outliers(Halo_DF, "percent_identity_local", "percent_aligned", 72, 40)
#'
#' @export

remove_outliers <- function(df, percent_identity_col, alignment_length_col, percent_identity_threshold = NULL, alignment_length_threshold = NULL) {
  # If no threshold is provided for percent_identity_col, use quartile ranges to determine outliers
  if (is.null(percent_identity_threshold)) {
    percent_identity_threshold <- quantile(df[[percent_identity_col]], 0.9)  # 10th percentile as the lower bound
  }
  
  if (is.null(alignment_length_threshold)) {
    alignment_length_threshold <- quantile(df[[alignment_length_col]], 0.1)  # 90th percentile as the upper bound
  }
  
  # Filter outliers based on the provided or calculated thresholds
  outliers <- df[df[[percent_identity_col]] > percent_identity_threshold & df[[alignment_length_col]] < alignment_length_threshold, ]
  
  new_results <- df
  
  # Replace the values in percent_identity_local for both species1_species2 and species2_species1 pairs
  for (i in 1:nrow(outliers)) {
    species1 <- outliers[i, "species1"]  # Get species1 from the row
    species2 <- outliers[i, "species2"]  # Get species2 from the row
    
  
    new_results[[percent_identity_col]][
      (new_results$species1 == species1 & new_results$species2 == species2) |
        (new_results$species1 == species2 & new_results$species2 == species1)
    ] <- NA  # Set matching pairs to NA
  }
  
  return(new_results)
}

