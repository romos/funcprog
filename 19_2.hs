{--
Задача 19-2
Одеров Роман, 545 гр.
--}

{-
-- Эта функция написана для моего понимания, не обращайте внимания :)
pascal = pascal' [1]
pascal' xs = xs : pascal' (zipWith (+) (xs++[0]) (0:xs))
-}

--Только надо убрать лишнюю функцию. Например, так:
pascal = [1] : map (\ps -> zipWith (+) (ps++[0]) (0:ps)) pascal

--О, а можно так :-)
pascal1 = [1] : zipWith (\p1 p2 -> zipWith (+) (p1++[0]) (0:p2)) pascal1 pascal1