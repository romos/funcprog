{--
Задача 6-4
Одеров Роман, 545 гр.
--}

data Tree = Empty
			| Node Integer Tree Tree

height Empty = 0
height (Node _ Empty Empty) = 0
height (Node i l r) = 1 + max (height l) (height r)
