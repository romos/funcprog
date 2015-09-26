{--
Задача 10-1
Одеров Роман, 545 гр.
--}

{-	Стоит заметить возможную схему генерации подобного массива массивов: (для [1,2,3])
powerset [1,2,3] = 
	[1]			|
	[1,2] [1,3]	|	1 : (все x из powerset[2,3])
	[1,2,3]		|

powerset [2,3] = 
	[2]			|	2 : (все x из powerset[3])
	[2,3]		|

powerset [3] = 
	[3]			|	3: (все x из powerset[])
	
	[]			|	default powerset[]

Т.е. надо соединить ф-цией foldr массивы
-}

powerset (x:xs) = 	let rest = powerset xs
					in foldr (:)
							 (map (\ys->(x:ys)) rest)	-- К каждому из имеющихся массивов добавить в начало пред.элемент;
							 							-- 		тем самым получим все массивы, начинающиеся с этого элемента
							 rest						-- Не забываем добавить еще и эти, ранее сгенерированые, массивы.
powerset [] = [[]]