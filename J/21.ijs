ps=: [:1&,[:1&>.[:>[:(*/\@$~)/&.>[:<"1[:|:2&p:
comb=: [:~.[:/:~[,],[:,*/ NB. combine factors, multiplying
divs=: -~ (+/ @ (comb/) @ ps) NB. probably not the best way to compute divisors
amic=: 1 = [: +/ (= divs`(divs@divs)`:0) NB. amicicable iff exactly one of divs, divs^2 matchs input
] e21=: +/ 2 + I. amic"0 (2+i.9999)
