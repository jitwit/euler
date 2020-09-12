NB. takes solve history and produces heatmap
hist =: ];._2 (1!:1) < 'jitwit_history_2020_09_12_1834.txt'
days =: todayno getdate"1 (0 5 ,: (#hist),9) ];.0 hist
histo =: (0,(-{:days)) +"_ 1 (#,{.)/.~ days
heat =: _7 ]\ ({."1 histo) ({:"1 histo)} 0 $~ 1 + ({.-{:) days
viewmat heat


