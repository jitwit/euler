NB. bounce equalateral triangle.

NB. tessellate complex plane with equilateral triangles so instead of
NB. reflecting we have straight lines. the vertices correspond to
NB. eisenstein integers, x+yw, where w = _1j3 % 2. If we start at C we
NB. want to end at C and the following shows where the c's are,
NB. assuming we enter triangle at origin and move up:

NB. CABCABCABC
NB. BCABCABCAB
NB. ABCABCABCA
NB. CABCABCABC

NB. and we see that the C's correspond eisenstein ints x+w y, x+y = 0
NB. (mod 3)

NB. ok so crossing. |x|-1   gives crossings of /
NB.                 |y|-1   gives crossings of -
NB.                 |x-y|-1 gives crossings of \

NB. because x+yw = (x-y) - y w^2. should be max 0 and above, but 0 is
NB. the only point of concern since we need x y coprime for it to be
NB. exit. (if g=gcd(x,y) then (x+yw)%g is actually where the beam
NB. exited.

NB. actually since we insist 0<x<y, we can get x+y+y-x-3 = 2*y-3

NB. last thing needed is way of counting coprime numbers (x,y), 3 | x+y

C =: (1 = +.) *. > *. 0 = 3 | +
B =: _3 + [ + ] + |@-
Y =: [: <. 0.5 * 3&+
W =: (3|-) + (*&3) @: i. @: <. @: (%&6)
E =: 2 * +/ @: (1 = (+. W)) @: Y NB. slow, almost too slow

NB. (0 0 0 , 10 120 200 ,: 255 255 255) viewmat
NB. experimentation:
NB. ([: (<./,>./) -.&0)"1 (C*B)"0/~ i. 300
NB. (,.~ i.@#) +./"1 (C*B)"0/~ i. 40

E 11      NB. => 2     ... yes!
E 1000001 NB. => 80840 ... yes!
NB. q: Y 12017639147
NB. E 12017639147

