wine_varieties = c("Zinfandel", "Merlot", "Cabernet")
wines = rep.int(seq_along(wine_varieties), times = c(8, 10, 12))

is_trial_a_success = function(){
  wine_selection = sample(wines, size = 6)
  
  variety_counts = tabulate(wine_selection, nbins = length(wine_varieties))
  
  # A success for 30e is if one of the variety
  # counts is 6.
  return(is.element(6L, variety_counts))
}





