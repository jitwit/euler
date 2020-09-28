mat=: ".;._2 (1!:1) < jpath '~/code/euler/J/345.in'

R =: - <./"1
C =: R &. |:
Z =: C @ R

M =: 4 : 0
NB. x is boxed list of row mask and col mask, y is matrix
NB. find min element not in mask, and reweight
assert. (#y) > +/#&>x
'r c'=. x [ js=. ($$i.@#) y
rm=. |: js e. r [ cm=. js e. c
a =. <./ 0 -.~ , (-. rm) * y * -. cm
(a * cm) + y - a * -. rm
)

NB. M basically gets vertex cover represented as list of two boxes
NB. with rows in firsta and columns in second awoiefj aoweijf aoef
(1 4;0 1) M (0 4;1 3) M Z mat

(; ((1 4;0 1)&M)@((0 4;1 3)&M)@Z;[:+/(1 3;3 1;0 0;2 2;4 4)&{) mat
(0 4;1 3) M Z mat
4 $. $. 0 = (1 4;0 1) M (0 4;1 3) M Z mat
4 $. $. 0 = (0 4;1 3) M Z mat
4 $. $. 0 = Z mat

NB. augmenting path algo. x ~ matching, y ~ graph
APA =: 4 : 0
n =. # G =. y [ M =. x NB. match standard nomenclature
U =. (i.n) -. {."1 x   NB. M-unsaturated vertices in X (rows)
T =. '' [ S =. U       NB. initial state

U;T;S
)


(0 0 ,: 4 4) APA Z mat
Z mat
