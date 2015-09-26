{--
Задача 9-1
Одеров Роман, 545 гр.
--}

identity n = map (\i -> map (\j->if j==i then 1 else 0) [1..n]) [1..n]
