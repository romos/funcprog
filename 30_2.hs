{--
Задача 30-2
Одеров Роман, 545 гр.
--}

{--
Задача о поиске часто встречающихся элементов.

В общем случае можно реализовать поиск элементов,
встречающихся более N/k раз, за O(k) памяти и O(n).

см. 
http://habrahabr.ru/post/167177/
http://keithschwarz.com/interesting/code/?dir=majority-element
--}

findMajor [] = Nothing
findMajor xs = 	let
					temp = fm xs 0 0
				in
					if check xs temp 0 0
					then Just temp
					else Nothing


fm [] stand candidate = candidate
fm (x:xs) stand candidate =
	if stand == 0
	then fm xs (stand+1) x
	else
		if candidate == x
		then fm xs (stand+1) candidate
		else fm xs (stand-1) candidate


check xs t count_t len_xs
	|xs == [] = (count_t > (len_xs /2))
	|otherwise =if head xs == t
				then check (tail xs) t (count_t+1) (len_xs+1)
				else check (tail xs) t (count_t) (len_xs+1)