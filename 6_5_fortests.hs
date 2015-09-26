{--
Задача 6-5
Одеров Роман, 545 гр.
--}

data Tree = Empty
			| Node Integer Tree Tree
			deriving Eq

----Working variant. Not so optimized as I want
--mh Empty = 0
--mh (Node _ Empty Empty) = 0
--mh (Node _ l r) = if (l == Empty) then 1 + mh r else
--						if (r == Empty) then 1 + mh l else
--							1 + min (mh l) (mh r)

mh Empty = 0
mh (Node i l r) = bfs 0 [(Node i l r)]

bfs h ns = 	if check ns
			then h
			else bfs (h+1) (childs ns)

check [] = False
check ((Node _ l r):ns)
	|l == Empty && r == Empty = True
	|otherwise = check ns

childs [] = []
childs ((Node _ l r):ns)
	|l /= Empty && r /= Empty = l:r:childs ns
	|l /= Empty = l:childs ns
	|r /= Empty = r:childs ns

----Probable optmization (doesn't work)
--mh Empty = 0
--mh (Node _ Empty Empty) = 0
--mh (Node _ l r) minh h = if (l == Empty) then 1 + mh r minh (h+1) else
--						if (r == Empty) then 1 + mh l minh (h+1) else
--							1 + min (mh l) (mh r)


----Someone's solution (some kind of DFS)
--minHeight t = minHeight' t (1/0) 0
--minHeight' Empty minH h = minH
--minHeight' (Node _ Empty Empty) _ h = h
--minHeight' (Node _ l r) minH h
--  | minH <= h = minH
--  | otherwise =
--      let
--        minH1 = min minH (minHeight' l minH (h + 1))
--      in minHeight' r minH1 (h + 1)