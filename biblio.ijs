NB. though J is great for writing tiny self-contained solutions, it'll
NB. be nice to have some common definitions.
coclass 'euler'

divisors=:[:}:([:~.[:/:~[:,*//)@([:1&>.[:>[:*/\@(1&,@($~)/)&.>[:<"1[:|:2&p:)`1:@.(=&1)

dsum=:+/@divisors"0
amicable=: (1=[:+/(=dsum`(dsum@dsum)`:0))"0

