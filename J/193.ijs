NB. square free numbers below N=2^50?
NB. given some x, the number of multiples of x below N is floor(N/x).
NB. moebius function is precisely what's needed to do the inclusion/exclusion.
NB. answer is sum_{1\le x^2 \le N} mu(x)*floor(N/x)
require 'stats/bonsai'
mu =: */ @: - @: ~: @: q:
sf =: <. @: (% *:) * mu"0@]

e193 =: +/ @: (sf 1 + i. @: <. @: %:)
e193 100
