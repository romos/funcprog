{--
Задача 18-2
Одеров Роман, 545 гр.
--}

days = 0:0:0:0:0:1:1:days
weekendExpences xs = sum (zipWith (*) days xs)