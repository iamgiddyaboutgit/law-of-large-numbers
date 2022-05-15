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

rm(card, rank, suit)
