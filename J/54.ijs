read_card=: ('CDHS'i.{:) + 2 (34 b.)'23456789TJQKA'i.{.
rank=: _2&(34 b.)
suit=: 3&(17 b.)
HAND_TYPES=: (5#1);(2,3#1);(1,~2#2);(3,2#1);'S';'F';3 2;4 1;'SF'
hand_type=: HAND_TYPES i. [: < #/.~

NB. order organizes cards by most pairs with ties broken by rank. ost
NB. is for organizing straights with low aces.
order=: \: ((,.~ [: +/"1 (=/~)) @: rank)
ost=: ]`(}.,13-~{.)@.(12 3-:2&{.)

straight=: ((4={.-{:)+.(12 3-:2&{.))*.([:-.[:=/2&{.)
flush=: 1=#@(#/.~suit)

NB. determine hand type. in boolean straight + 2 * flush determins if
NB. straight flush, flush, straight, or some pairing.
hand=: ((,~hand_type)@]`(4,ost@])`(5,])`(8,ost@])@.(straight@]+[:+:flush@[)rank)@:order

NB. winner compares hand type then breaks ties by comparing ranks. 0
NB. indicates draw, _1 left player wins, and 1 right player wins.
winner=: ([:<:[:+:[:(-: /:~),&{.)`((([:<:[:+:[:(-: /:~);)`0:@.-:)&}.)@.(-:&{.)&hand

hands=: ([: read_card ;._2 ' ',~]) ;. _2 freads'poker.txt'
player1_wins=: (_1 = 5&{. winner 5&}.)"1
]e54=: +/ player1_wins hands
