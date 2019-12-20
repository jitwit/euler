mem=:1000000$_1
mem=:0(0})mem
mem=:1(1})mem

collatz=:(-:`([: >: 3&*))@.(2&|)

chain=: 3 : 0 NB. only save values for numbers < 1000000
if. 1000000<:y do. 1 + chain collatz y
elseif. 0 <: y{mem do. y{mem
else. l [ mem=:l(y})mem [ l=.1+chain collatz y
end.
)

mem i. >./ chain"0 i. 1000000