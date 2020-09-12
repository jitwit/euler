rank=: _2&(34 b.)
suit=: 3&(17 b.)
hand_type=: ((5#1);(2,3#1);(1,~2#2);(3,2#1);'S';'F';3 2;4 1;'SF') i. [: < #/.~

order=: \: ((,.~ [: +/"1 (=/~)) @: rank)
ost=: ]`(}.,13-~{.)@.(12 3-:2&{.)

straight=: ((4={.-{:)+.(12 3-:2&{.))*.([:-.[:=/2&{.)
flush=: 1=#@(#/.~suit)
classify=: straight@] + [:+:flush@[
hand=: ((,~hand_type)@]`(4,ost@])`(5,])`(8,ost@])@.classify rank)@:order
winner=: (([:<:[:+:[:(-: /:~);)`0:@.-:)&hand

hands=: ([: (('CDHS'i.{:) + 4*'23456789TJQKA'i.{.) ;._2 ' ',~]) ;. _2 freads'~/code/euler/input/poker.txt'
]e54=: +/ (_1 = 5&{. winner 5&}.)"1 hands