-- Извините, не дочитал условие.
-- Прочитал только *Простое упражнение на использование >>= и do нотации*,
-- и сразу стало понятно, как делать :-)
-- Надеюсь, сейчас я уложился в условие.

{--
Задача 32-1
Одеров Роман, 545 гр.
--}

triangle1 n = [1..n] >>= \i -> ([1..i] >>= \i1 -> return (i1*i1))
triangle1' n = [1..n] >>= \i -> ([1..i] >>= \i1 -> [i1*i1])

triangle2 n = 
	do
		i <- [1..n]
		do
			i1 <- [1..i]
			[i1*i1]