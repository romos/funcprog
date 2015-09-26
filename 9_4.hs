{--
Задача 9-4
Одеров Роман, 545 гр.
--}

-- recursive way:
-- repeatFunc f 1 = f
-- repeatFunc f n = f.(repeatFunc f (n-1))

-- correct way: 
-- repeatFunc f n = foldr (.) f (map (\_ -> f) [1..(n-1)])

si3 x = let f = repeatFunc sin 3
				in f x