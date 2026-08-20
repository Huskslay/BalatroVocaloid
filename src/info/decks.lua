
BV.Decks = {}


-----------------------------------------------------------
-- Vocaloid --
-----------------------------------------------------------

BV.Decks.Vocaloid = {
   name = 'Vocaloid Deck',
   change_suits = {"hearts", "clubs", "diamonds", "spades"},
   change_ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"},
   display_ranks = {"Jack", "Queen", "King"},

   lc = {
      path = 'decks/vocaloid_lc.png',
      colours = {'F03464', '235955', 'F06B3F', '3C4368'},
   },
   hc = {
      path = 'decks/vocaloid_hc.png',
      colours = {'E32B1F', '008DE4', 'E39100', '27863B'}
   }
}
