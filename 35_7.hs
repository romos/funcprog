{--
Задача 35-7
Одеров Роман, 545 гр.
--}

toInt nChurch = nChurch (\t->t+1) 0

inc nChurch = \f x -> f(nChurch f x)
{-
\ f x -> f (f (f x))	==>		\ f x -> f (f (f (f x)))
-}

dec n = fst (n (\(_,b)->(b,inc b)) (zer,zer))   where zer s z = z
