{--
Задача 15-1
Одеров Роман, 545 гр.
--}

{-	Собираем делители сразу парами: если число x - делитель N, то соответствующее частное N/x - тоже делитель.
	Т.о. сразу включаем его в список. Образуется список пар. Все эти числа надо сложить, но:
	из пары (1,N) и (x,x) надо брать только 1 и x соответственно.
-}
sumDiv n = foldl (\res (x,y) -> if (x == 1 || x == y) then res+x else res+x+y ) 0 [ (x,div n x) | x<-[1.. truncate (sqrt (fromIntegral n))], mod n x == 0 ]

perfects n = [x|x<-[2..n], sumDiv x == x]