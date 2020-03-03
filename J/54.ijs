hands0=: freads'poker.txt'
hands=: parse_hand ;. _2 hands0

read_card=: (13*'CDHS'i.{:) + '23456789TJQKA'i.{.
show_card=: ('23456789TJQKA'{~ rank),'CDHS'{~suit
show_hand=: show_card"0

eg_sf=: parse_hand '3S 5S 4S 6S 7S'
eg_st=: parse_hand 'AS 2S 3S 4S 5C'
eg_pr=: parse_hand '3S 5H 4S 4S 7S'
eg_2p=: parse_hand '7S 5H 4S 4C 7C'
eg_3k=: parse_hand '8S 4H 4S 4C 7C'
eg_fh=: parse_hand '7S 4H 4S 4C 7C'
eg_hi1=: parse_hand '7S TH KS 8C AC'
eg_hi2=: parse_hand '7S TH KS 9C AC'

parse_hand=: [: read_card ;._2 ' ',~]

]HAND_TYPES=: (5#1);(2,3#1);(1,~2#2);(3,2#1);'S';'F';3 2;4 1;'SF'

rank=: 13&|
suit=: [: <. %&13

NB. organize hand by most pairs ties broken by card rank
order=: \: ((,.~ [: +/"1 (=/~)) @: rank)
flush=: 1=#@(#/.~suit)
straight=: (4={.-{:)+.(12 3-:2&{.)
order_straight=: ]`(}. , 13-~{.) @.(12 3-:2&{.)

hand=: monad define
y=. order y
r=. rank y
select. (straight r) + +: flush y
case. 3 do. 8,order_straight r
case. 2 do. 5,r
case. 1 do. 4,order_straight r
case. 0 do. (,~ (HAND_TYPES i. [: < #/.~)) r
end.
)

NB. basic idea: if exact match, tie rep by 0, else see if ; matches
NB. sorting it and return _1 if left x wins or 1 if y does.
NB. first look at hand type ({.) if that's equal look at ranks
compare=: ([:<:[:+:[:(-: /:~);)`0:@.-:
winner=: ([:<:[:+:[:(-: /:~),&{.)`(compare&}.)@.(-:&{.)&hand

NB. off by 6...
]e54=: +/ _1 = (5{."1 hands) winner"1 (5}."1 hands)

study_hand=: monad define
h=. hand y
(|: show_hand y);h;({. h) {:: HAND_TYPES
)

demo=: (winner) ; [: < (,. & study_hand)
