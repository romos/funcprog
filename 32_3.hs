{--
Задача 32-3
Одеров Роман, 545 гр.
--}

find cond (x:xs) = if cond x then (x, xs) else find cond xs

(>>>) find1 find2 xs = find2 (snd (find1 xs))

-- f = find (>3) >>> find (>3) 

