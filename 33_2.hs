{--
Задача 33-2
Одеров Роман, 545 гр.
--}


data Tree = Empty |
			Node Char Tree Tree
			deriving Show

toStr e = f e []

frmstr (n:xs)
	|n == 'n' = 
		let
			(l,xs1)=frmstr (tail xs)
			(r,xs2)=frmstr xs1
		in
			(Node (head xs) l r, xs2)
	|otherwise = (Empty,xs)

fromStr str = fst (frmstr str)


f (Empty) = ('e':)
f (Node x l r) = ('n':).(x:).(f l).(f r)
