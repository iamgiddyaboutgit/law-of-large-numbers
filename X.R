source("construct-sequence.R")

# We will draw two cards from a shuffled deck.
# Suppose the second card is not a face card (King, Queen, or Jack).
# Let X be 1 if the first card is not a Jack and 0 otherwise.
X = function(){
  x = mean(seq_data$lengths[seq_data$values == 1L])
  
  return(x)
}
