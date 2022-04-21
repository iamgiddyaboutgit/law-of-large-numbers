# construct a standard 52-card deck
# Aces are rank 1
# Jacks are rank 11
# Queens are rank 12
# Kings are rank 13
ranks = seq.int(13) 
# Clubs, Diamonds, Hearts, and Spades are suits 1,2,3, and 4, respectively.
suits = seq.int(4)

cards = vector("list", length = 52L)

card = 1
for (rank in ranks) {
  for (suit in suits) {
    cards[[card]] = c(rank, suit)
    card = card + 1
  }
}

# Permute the deck.
# Let X be the number of cards that follow a card of the same suit.
X = function(){
  card_permutation = sample(cards, size = 52, replace = FALSE)
  suit_permutation = vapply(card_permutation, FUN = `[`, FUN.VALUE = integer(1L), 2)
  
  lengths_of_runs_of_same_suit = rle(suit_permutation)$lengths
  is_the_run_longer_than_one = lengths_of_runs_of_same_suit > 1
  
  number_of_runs_of_same_suit_longer_than_one = sum(is_the_run_longer_than_one)
  sum_of_lengths_of_runs_of_same_suit_longer_than_one = sum(lengths_of_runs_of_same_suit[is_the_run_longer_than_one])
  X = sum_of_lengths_of_runs_of_same_suit_longer_than_one - number_of_runs_of_same_suit_longer_than_one
  
  return(X)
}
