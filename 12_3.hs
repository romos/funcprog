{--
Задача 12-3
Одеров Роман, 545 гр.
--}

mymap f xs = foldr (\x res -> (f x):res) [] xs

-- для проверки:
-- realmap f xs = map f xs