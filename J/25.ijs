digs=:10&#.^:_1
NB. ] e25slow=:# (([:$:(0&{+1&{),])`}.@.(>&999@(#@digs@{.)) x: 1 0)
NB. 10^1000.
NB. maybe can use phi. Fn = (phi^n - (-phi)^-n) / (2*phi-1).
NB. solving (phi^n - (-phi)^-n) / (2*phi-1) > 10^1000
phi=:-:>:%:5x
]e25 =: (1000x+10x^.5x)%(10x^.(phi))

