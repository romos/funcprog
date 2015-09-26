{--
Задача 18-5
Одеров Роман, 545 гр.
--}
data Tree = Empty |
			Node Integer Tree Tree

foldTree f e Empty = e
foldTree f e (Node val l r) = 
	let 
		resl = foldTree f e l
		resr = foldTree f e r
	in f val resl resr

sumPos t = foldTree (\i l r -> let lr = l+r in if (i > 0) then i+lr else lr) 0 t