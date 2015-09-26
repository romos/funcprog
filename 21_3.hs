{--
Задача 21-3
Одеров Роман, 545 гр.
--}

merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
	| x < y = x : merge xs (y:ys)
	| x > y = y:merge (x:xs) ys
	|otherwise = x:merge xs ys