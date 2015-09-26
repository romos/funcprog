{--
Задача 3-1
Одеров Роман, 545 гр.
--}


minlist [x] = x
minlist (x1:x2:xs) = minlist' x1 (x2:xs)

--функция, исполняющая поиск минимума перебором, запоминая очередной минимум
minlist' x (h:xs) = minlist' (minEl x h) xs
minlist' a [] = a


--функция, определяющая минимум между двумя числами
minEl a b = if (a <= b) then a else b