dsum=: +/@:((]*[:<.%)(>:@i.)) M.

e153=: 3 : 0
A=. 1 2 +/ . * dsum"0 y , <.y%2
lim =. <. %: y
a =. 1
while. a <: lim do. b =. a+1
  while. b <: lim do.
    if. 1=a+.b do.
      A =. A + +: (a+b) * dsum <. y % (*: a) + *: b
    end. b =. >: b
  end. a =. >: a
end. A
)


