NB. S=: (I. e.&H 5 p: i.>:L)

NB. S includes all hammings
NB. some others as well. seems possible to throw in a prime, so long as
NB. p-1 is smooth.
NB. /:~~.,(2x ps L) */ (3x ps L) */ (5x ps L)

L=: 1e5
NB. 1e12

pows=: [ ^ [: i. [: >. ^.
trun=: (#~ <:&L)
comb=: [: ~. [: (#~ * *. <:&L) [: , */
hams=: trun }. /:~ ~. ; *// 2x 3x 5x pows"0/ L
pris=: 3 }. (#~ <:&L *. 1&p:) 1+hams
NB. brut=: I. e.&hams 5 p: i.1+L
NB. answer=:  +/ hams comb/ comb/ |: 1 ,: pris

prods=: monad define
ans=. y
for_p. |. y do.
  echo p
  t=. p*ans {.~ ans I. >. L%p
  ans=. /:~ ans , t
end. ans
)

solve=: monad define
ans=. hams
for_p. |. pris do.
  echo p
  t=. p*ans {.~ ans I. >. L%p
  ans=. /:~ t,ans
end. +/ ans
)

NB. 15058726287897613779