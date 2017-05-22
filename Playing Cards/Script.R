#Import the data set of deck of cards
deck <- read.csv("deck.csv", stringsAsFactors = FALSE)

        
setup <- function(deck) {
        DECK <- deck
        #A function that returns the top card from the deck
        DEAL <- function() {
                card <- deck[1, ]
                assign("deck", deck[-1, ], envir = parent.env(environment()))
                card
        }
        
        #A function that shuffles the deck
        SHUFFLE <- function() {
                random <- sample(1:52, size = 52)
                assign("deck", DECK[random, ], parent.env(environment()))
        }
        
        list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle