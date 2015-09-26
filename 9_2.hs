{--
Задача 9-2
Одеров Роман, 545 гр.
--}

countOdd [] = 0
countOdd xs = foldr (\x i->if mod x 2 == 0 then i else i+1 ) 0 xs

countOdd1 [] = 0
countOdd1 xs = length (filter (\x->mod x 2 /= 0) xs)

countOdd1' [] = 0
countOdd1' xs = sum (map (\x->mod x 2) xs)