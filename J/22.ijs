require 'tables/csv'
names=: , readcsv '~/code/euler/input/22.in'
letter=: >:@i.~&'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
score=:[:+/[:(*>:@i.@#)[:+/"1[:/:~[:>letter&.>
]e22=: score names
