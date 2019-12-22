batch=: (+ i.)/@(*/ , >./)@$
wind=: |:@|.,(+i.)/@(*/,>./)@$
build =: 13 : '>:(wind^:(4*y))1 1$0'
NB. diagonal indices
d1=: {~(<"1@,.~@i.@#)[d2=:{~(<"1@(,.([:<:#-]))@i.@#)

NB. slow but fun solution
e28=: [:<:[:+/(d1,d2)@build@<.@-: