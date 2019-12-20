require'~/code/euler/biblio.ijs'
coinsert'euler'
dsum=:+/@divisors"0
amicable=: (1=[:+/(=dsum`(dsum@dsum)`:0))"0
ps=: [:1&,.[:1&>.[:>[:(*/\@$~)/&.>[:<"1[:|:2&p:
ds=: (-~(+/@(([:~.[:,*/)/)@ps))`1:@.(=&1)
]e21=: +/ 2 + I. (1=[:+/(=ds`(ds@ds)`:0))"0 (2+i.9999)
]f21=: +/ 2 + I. amicable (2+i.9999)