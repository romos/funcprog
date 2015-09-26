{--
Задача 3-2
Одеров Роман, 545 гр.
--}


minsum [x] = x
minsum [x1,x2] = x1+x2
minsum (x1:x2:xs) = minsum' (x1+x2) (x2:xs)

--функция, исполняющая поиск минимума перебором, запоминая очередной минимум суммы 2-х соседних эл-тов
minsum' s [xlast] = s
minsum' x1x2 (x2:x3:xs) = minsum' (minEl x1x2 (x2+x3)) (x3:xs)


--функция, определяющая минимум между двумя числами
minEl a b = if (a <= b) then a else b