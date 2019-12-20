
NB. d * tri (floor (lim/d)), ie d + 2d + ... below lim
NB. take two numbers and include lcm in list


euler1 =: +/ @: (]*(-:*>:)@:<.@:%) (],-@:*./)
999 euler1 3 5
