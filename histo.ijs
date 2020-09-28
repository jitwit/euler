NB. takes solve history and produces heatmap
require '~/code/J-esquisse/color.ijs'
t =: ];._2 (1!:1) < 'jitwit_history_2020_09_12_1834.txt'
d =: todayno getdate"1 ((0,#t),.5 9) ];.0 t
h =: (0,(-{:d)) +"_ 1 (#,{.)/.~ d
heat =: _7 ]\ ({."1 h) ({:"1 h)} 0 $~ 1 + ({.-{:) d
p =: (rcolor'') ((1+>./,heat) cpath) (rcolor'')
NB. p viewmat (^.@>:)^:2 |: heat
'~/j902-user/temp/viewmat.png' linki ((,"_1/^:2) 10 10&$"0 |: heat) { p
