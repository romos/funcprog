{--
Задача 29-4
Одеров Роман, 545 гр.
--}


cartesian xs ys = xs >>= \x -> (ys >>= \y -> [(x,y)])
							 