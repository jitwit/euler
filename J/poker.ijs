read_card=: ('CDHS'i.{:) + 2 (34 b.)'23456789TJQKA'i.{.
show_card=: ('23456789TJQKA'{~ rank),'CDHS'{~suit
show_hand=: show_card"0
parse_hand=: [: read_card ;._2 ' ',~]
rank=: _2&(34 b.)
suit=: 3&(17 b.)

HAND_TYPES=: (5#1);(2,3#1);(1,~2#2);(3,2#1);'S';'F';3 2;4 1;'SF'
hand_type=: HAND_TYPES i. [: < #/.~

NB. organize cards by most pairs with ties broken by rank. ost for straights
order=: \: ((,.~ [: +/"1 (=/~)) @: rank)
ost=: ]`(}.,13-~{.)@.(12 3-:2&{.)

straight=: ((4={.-{:)+.(12 3-:2&{.))*.([:-.[:=/2&{.)
flush=: 1=#@(#/.~suit)

hand=: ((,~hand_type)@]`(4,ost@])`(5,])`(8,ost@])@.(straight@]+[:+:flush@[)rank)@:order
winner=: ([:<:[:+:[:(-: /:~),&{.)`((([:<:[:+:[:(-: /:~);)`0:@.-:)&}.)@.(-:&{.)&hand
