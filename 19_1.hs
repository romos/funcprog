{--
Задача 19-1
Одеров Роман, 545 гр.
--}


sqrt2 = sqrt2' 2 0
sqrt2' n prev = let curr = getNextDig n prev
				in curr : sqrt2' (100*n) (10*(prev + curr))

getNextDig n prev = head (filter (\x -> (x + prev)^2 <= n) (reverse [0..9]))
