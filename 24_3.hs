{--
Задача 24-3
Одеров Роман, 545 гр.
--}

allNondivisible xs = allNondiv xs (const True)
allNondiv [] f = True
allNondiv (x:xs) f = 	if (f x)
						then
							allNondiv xs (\t -> f t && (x `mod` t /= 0) && (t `mod` x /= 0))
						else
							False