{--
Задача 22-1
Одеров Роман, 545 гр.
--}

{-
Нам нужны все возможные числа, полученные из 1 умножением на 3 и на 10.
При этом они должны идти в порядке возрастания
Используем merge и пробуем смержить списки последовательного умножения на 3 и на 10
-}
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
	| x < y = x : merge xs (y:ys)
	| x > y = y:merge (x:xs) ys
	|otherwise = x:merge xs ys

ham = 1 : merge (map (\h->h*10) ham) (map (\h->h*3) ham)

{-
-- Сначала я пробовал итеративно "вручную" пробовать вычислять значения, но что-то не продумал. 
-- Поэтому этот способ пропускает иногда числа, полученные чередованием умножения на 3 и на 10. Например,
-- 		take 10 ham'' = [1,3,9,10,27,81,100,243,729,1000]
-- По сравнению с методом выше, здесь отсутствуют 30, 90, 270, 300, 810, 900 ...

ham'' = 1:ham' [] 1 1 1
ham' xs x3 x10 xlast =  let
							x3' = x3 * 3
							x10' = x10 * 10
							xlast3 = xlast * 3
							xlast10 = xlast * 10
							xmin = minimum [x3',x10',xlast3,xlast10]
						in
							if (xmin == x3')
							then if (x3'==xlast3)
								 then (xmin : (ham' xs x3' x10 xlast3))
								 else (xmin : (ham' xs x3' x10 xlast))
							else
								if (xmin == x10')
								then if (x10'==xlast10)
									 then (xmin : (ham' xs x3 x10' xlast10))
									 else (xmin : (ham' xs x3 x10' xlast))
								else
									if (xmin == xlast3)
									then if (x3'==xlast3)
										 then (xmin : (ham' xs x3' x10 xlast3))
										 else (xmin : (ham' xs x3 x10 xlast3))
									else
										if (xmin == xlast10)
										then if (x10'==xlast10)
									 		 then (xmin : (ham' xs x3 x10' xlast10))
									 		 else (xmin : (ham' xs x3 x10 xlast10))
										else []
-}

