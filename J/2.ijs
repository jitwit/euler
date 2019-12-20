
build_fibs=: ([: $: (0&{ + 1&{) , ])`(|. @ }.)@.(>&4000000 @ {.)
fibs=: build_fibs 1 0
answer=: +/ fibs {~ I. 0=2&| fibs
