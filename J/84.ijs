states=: i.120

droll=: (%+/) (0,12$0 1),(40-13)#0
nroll=: (%+/) droll -~ (+/"1 (i.13) =/ , +/~ 1+i.6),(40-13)#0
singles=: (80#0) ,~ nroll |.~ [: - 40 | ]
doubles=: monad define
select. <.y%40 NB. # of doubles currently
case. 0 do. (40#0) , ((-40|y) |. droll) , (40#0)
case. 1 do. (80#0) , (-40|y) |. droll
case. 2 do. 1 (10}) 120#0
end.
)

roll=: (5r6 * singles) + (1r6 * doubles)
chest=: monad define
(14r16 * roll y) + (1%16) (10,40*<.y%40)} 120#0
)

nextU=: 12 28 12 {~ 12 28 I. 40|]
nextR=: (5,~5+10*i.4) {~ (5+10*i.4) I. 40 | ]

chance=: monad define
sft=.40*<.y%40
ps=. (6r16 * roll y) + 1r16 (10,sft+0 11 24 39 5,(40|y-3),nextU y)} 120#0
rs=. sft + nextR y
(2r16 + rs { ps) rs} ps
)

move=: monad define
if.     30=40|y         do. 1 (10}) 120#0
elseif. 2 17 33 e.~ 40|y do. chest y
elseif. 7 22 36 e.~ 40|y do. chance y
else.                        roll y end.
)

monopoly=: move"0 states
pos=: (% +/) 120#1
step=: (+/ .*)&monopoly

condense=: 40 {. (+ 40&|. + 80&|.)

end=: [: condense [: step (80#0) ,~ ]

experiment=: verb : 'condense"1 step ^: (i.y) 1,119#0'