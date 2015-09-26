{--
Задача 27-1
Одеров Роман, 545 гр.
--}

queens n k
		| (k == 0 || n == 0) = [[]] -- если нечего расставлять, или негде расставлять, то пустой список
		|otherwise = queens' n k 1 (const False) -- если есть, что расставлять, то начинаем с первого ферзя

queens' n k x conflict = if x> k then [[]] -- если расставили всех ферзей, то пусто
					 else [ (x, y):xs | 	y <- [1..n],	-- иначе перебираем горизонтали
									not (conflict (x, y)),
									xs <- queens' n k (x + 1) (\t -> conflict t || abs (fst t - x) == abs (snd t - y) || snd t == y) ]