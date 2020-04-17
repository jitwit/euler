read_card=: ('CDHS'i.{:) + 2 (34 b.)'23456789TJQKA'i.{.
show_card=: ('23456789TJQKA'{~ rank),'CDHS'{~suit
show_hand=: show_card"0
parse_hand=: [: read_card ;._2 ' ',~]
rank=: _2&(34 b.)
suit=: 3&(17 b.)

HAND_TYPES=: (5#1);(2,3#1);(1,~2#2);(3,2#1);'S';'F';3 2;4 1;'SF'
hand_type=: HAND_TYPES i. [: < #/.~

order=: \: ((,.~ [: +/"1 (=/~)) @: rank)
ost=: ]`(}.,13-~{.)@.(12 3-:2&{.)

straight=: ((4={.-{:)+.(12 3-:2&{.))*.([:-.[:=/2&{.)
flush=: 1=#@(#/.~suit)

hand=: ((,~hand_type)@]`(4,ost@])`(5,])`(8,ost@])@.(straight@]+[:+:flush@[)rank)@:order
winner=: ([:<:[:+:[:(-: /:~),&{.)`((([:<:[:+:[:(-: /:~);)`0:@.-:)&}.)@.(-:&{.)&hand

comb=: 4 : 0
  if. x e. 0 1 do. z=.<((x!y),x)$ i.y
  else. t=. |.(<.@-:)^:(i.<. 2^.x)x
    z=.({.t) ([:(,.&.><@;\.)/ >:@-~[\i.@]) ({.t)+y-x
    for_j. 2[\t do.
      z=.([ ;@:(<"1@[ (,"1 ({.j)+])&.> ])&.> <@;\.({&.><)~ (1+({.j)-~{:"1)&.>) z
      if. 2|{:j do. z=.(i.1+y-x)(,.>:)&.> <@;\.z end.
    end.
  end.
  ;z
)

combbool=: 4 : 0
k=. <"1 (-i.1+d=.y-x)|."0 1 y{.1
z=. (d$<(0,y)$0),<,:y#0
for. i.x do. z=. k (+."1)&.> ,&.>/\. (_1&|."1)&.> z end.
; z
)

example=: 'QH TH 8S 8H 9H 9D 8C'

holdem=: (5 combbool 7) #"1 _ ]

NB. HANDS=: 5 comb 52
NB. TYPES=: ({.@hand)"1 HANDS
]chart=: HAND_TYPES ,. <"0 +/"1 (i.9) =/ TYPES