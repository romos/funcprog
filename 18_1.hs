{--
Задача 18-1
Одеров Роман, 545 гр.
--}

bigSin n = head (filter (\sinus -> sinus > n) (map sin [1..]))