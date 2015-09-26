{--
Задача 18-4
Одеров Роман, 545 гр.
--}

fib  = 1:1:zipWith (+) fib (tail fib)