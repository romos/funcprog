{--
Задача 29-3
Одеров Роман, 545 гр.
--}


doubleEven xs = xs >>= \x->	if mod x 2 == 0
							then [x,x]
							else [x]
							 