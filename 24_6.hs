{--
Задача 24-6
Одеров Роман, 545 гр.
--}

data Tree = Empty 
			| Node Int Tree Tree

--Первая версия, пришедшая мне в голову.
flatten t = f t []
f Empty = id
f (Node x l r) = (x:).(f l).(f r)

-- Вторая версия. С использованием написанной нами ранее foldTree.
foldTree f e (Node val l r) = f val (foldTree f e l) (foldTree f e r)
foldTree f e Empty = e
			
flatten1 t = foldTree (\x l r -> (x:).(l).(r)) id t []