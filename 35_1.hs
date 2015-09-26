{--
Задача 35-1
Одеров Роман, 545 гр.
--}

find cond [] = Nothing
find cond (x:xs) = if cond x then Just x else find cond xs

f xs = 	do
			x <- find (<5) xs
			y <- find (>10) xs
			z <- find (/=7) xs
			return (x+y+z)

