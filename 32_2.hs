{--
Задача 32-2
Одеров Роман, 545 гр.
--}
find cond [] = []
find cond (x:xs) = 	if cond x then [x] else find cond xs

f xs = let
			result = ([(<5),(>10),(/=7)] >>= \i -> find i xs)
	   in
			if length result == 3
			then [sum result]
			else []