e9=: 3 : 0 NB. a + b + c = y
y_3=.<.y%3 [ y_2=.>.y%2
for_c. y_3+i.y_2-y_3 do. c_2=. <.c%%:2
  for_a. 1+i.c_2 do.
    b=. %: (c (- & *:) a)
    if. (b-:<.b) *. (y-:a+b+c) do. y=. a*b*c return. y end.
  end.
end.
)

":!.8 e9 1000
