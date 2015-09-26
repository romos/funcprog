{--
Задача 15-4, более общий foldTree
Одеров Роман, 545 гр.
--}

{-! DOES NOT WORK !-}

data Tree = Empty
			| Node Integer Tree Tree


{-Кажется, придумал насчет более общего foldTree-}
foldTree f start Empty = start
foldTree f start (Node n l r) = f n (foldTree f start l)  (foldTree f start r)
-- Например,foldtree (\n l r -> n+r+l) Empty (Node 1 (Node 3 Empty Empty) (Node 2 Empty Empty))

