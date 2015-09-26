{--
Задача 29-1
Одеров Роман, 545 гр.
--}


findMajor xs = 	let
					summ = sum xs
				in
					findMajor' xs summ

findMajor' [] _ = Nothing
findMajor' (x:xs) summ = 	if x > summ-x 
							then Just x 
							else findMajor' xs summ