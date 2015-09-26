{--
Задача 29-2
Одеров Роман, 545 гр.
--}


find f [] err = err
find f (x:xs) err = if f x then x 
			    else find f xs err

findInLists [] cond err = err
findInLists (xs:xss) cond err = find cond xs (findInLists xss cond err) 
