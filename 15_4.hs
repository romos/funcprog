{--
Задача 15-4
Одеров Роман, 545 гр.
--}

data Tree = Empty
			| Node Integer Tree Tree


-- левосторонний обход
{-
	Запускаем foldTree от поддерева с обновленным "аккумулятором", равным вычисленному значению функции от другого поддерева.
	Здесь левое поддерево считается сначала.
-}
foldTree f start Empty = start
foldTree f start (Node n l r) = foldTree f (foldTree f (f n start) l) r

-- правосторонний обход
{-
	Запускаем foldTree от поддерева с обновленным "аккумулятором", равным вычисленному значению функции от другого поддерева.
	Здесь левое поддерево считается сначала.
-}
foldTree' f start Empty = start
foldTree' f start (Node n l r) = foldTree' f (foldTree' f (f n start) r) l


-- что-то, основанное на простой рекурсивной идее: f(Node i l r) = f(l) и f(r)
foldTree'' f start Empty = start
foldTree'' f start (Node n l r) = f (foldTree'' f (f n start) l)  (foldTree'' f start r)


{-
	Никак не придумать, как сделать нечто более общее...
	Или как записать, например, высоту дерева с помощью имеющихся выше функций.
-}

