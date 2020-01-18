
NB. exploration
P=: i.@! A. i.
sat=: [: +/ [: }. ] > _1&|.
brute=: [: (] {~ [: (I.) 1 = sat"_1) P
class=: i. (([: +/ E.)"0 1) [: 0&{"_1 brute

NB. solution
p=: !&26 * <: @ (-~ 2&^)
]e158=: >./ p i.26x
