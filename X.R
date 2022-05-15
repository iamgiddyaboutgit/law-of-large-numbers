source("construct-deck-of-cards.R")

# We will draw two cards from a shuffled deck.
# Suppose the second card is not a face card (King, Queen, or Jack).
# Let X be 1 if the first card is not a Jack and 0 otherwise.
X = function(){
  card_permutation = sample(cards, size = 52, replace = FALSE)
  draw = card_permutation[sample.int(n = 52, size = 2, replace = FALSE)]
  draw = unlist(lapply(draw, `[[`, 1))
  # While the 2nd card is a face card, 
  # do another draw.
  while (draw[2] %in% c(11, 12, 13)) {
    draw = card_permutation[sample.int(n = 52, size = 2, replace = FALSE)]
    draw = unlist(lapply(draw, `[[`, 1))
  }
  
  if (draw[1] != 11L) {
    X = 1
  } else {
    X = 0
  }
  
  return(X)
}
