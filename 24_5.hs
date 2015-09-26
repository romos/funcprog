{--
Задача 24-5
Одеров Роман, 545 гр.
--}

{-
Идея: сортируем, а потом сравниваем каждую пару подряд идущих чисел.
-}
import Data.List

findSame [] = "Nothing to compare: empty input list."
findSame xs = fs (sort xs)

fs (x:y:xs) = 	if (x==y)
				then "Repeatable value found: " ++ show x
				else 
					if (xs /= [])
					then fs (y:xs)
					else "All elements are unique"

{-
findSame [] = Nothing
findSame (x:xs) = if elem x xs then Just x 
			     else findSame xs
-}

{-
findSame [] = "Nothing to compare: empty input list."
findSame xs = findSame1 xs

findSame1 [] = "All elements are unique"
findSame1 (x:xs) =
        if elem x xs then "Repeatable value found: " ++ show x
        else findSame1 xs
-}