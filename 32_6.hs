{--
Задача 32-6
Одеров Роман, 545 гр.
--}

sum_cps [] f = f 0
sum_cps (x:xs) f = sum_cps xs (f.(+x))


--sum_cps' [] f = f 0
--sum_cps' (x:xs) f = f (sum_cps xs (+x))
