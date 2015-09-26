{--
Задача 24-4
Одеров Роман, 545 гр.
--}

superMap f xs = [x | y<-xs, x <- f y]

superMap' f xs = foldr (++) [] (map f xs)