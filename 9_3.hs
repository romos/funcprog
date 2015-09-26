{--
Задача 9-3
Одеров Роман, 545 гр.
--}

myfoldl f e [] = e
myfoldl f e (x:xs) = myfoldl f (f e x) xs