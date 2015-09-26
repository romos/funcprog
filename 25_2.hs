{--
Задача 25-2
Одеров Роман, 545 гр.
--}

{-
Полином с целочисленными коэффициентами.
Операции (+), (*), (==), show.

p.s. Мне было довольно лень писать хорошую функцию show для многочлена :( Поэтому она работает не очень красиво.
Хотя, по-моему, отображение многочлена в виде обычного массива чисел вполне сносно выглядит и без X-ов и степеней.
-}

data Polynom = P [Int]

instance Num (Polynom) where
	(P p1) + (P p2) = P (add p1 p2)
	(P p1) * (P p2) = P (delNull (multPoly (p1) (p2)))

instance Eq (Polynom) where
	(P p1) == (P p2) = let
						lp1 = length p1
						lp2 = length p2
					  in
					  	if lp1 < lp2
					  	then (p1++[x|x<-(map (const 0) [1..(lp2-lp1)])]) == p2
					  	else p1 == (p2 ++ [x|x<-(map (const 0) [1..(lp1-lp2)])])

instance Show (Polynom) where
	show (P p) = showPoly p
	--show (P p) = show p


----------------------------------------------
--Удалить незначащие нули при старших степенях
delNull [] = []
delNull xs = if (last xs == 0) then delNull (init xs) else xs

-- Сложение двух многочленов в терминах массивов
add p1 p2 = let
				lp1 = length p1
				lp2 = length p2
			in
			  	if lp1 < lp2
			  	then (delNull (zipWith (+) (p1 ++ repeat 0) p2))
			  	else (delNull (zipWith (+) p1 (p2 ++ repeat 0)))


-- Реализация умножения двух многочленов в терминах массивов
---- умножение на число
multByNum num p = map (*num) (delNull p)

---- умножение на X
multByX p = delNull (0:p)

---- непосредственно умножение двух многочленов
multPoly [] p2 = []
multPoly (p:p1) p2 = let
						pp2 = multByNum p p2
						xpp2 = multByX (multPoly p1 p2)
                     in add pp2 xpp2

-- Процедура отображения многочлена
showPoly p =let
				--делаем пары (коэффициент,степень) для нашего многочлена. Только ненулевые коэффициенты.
				coeff = filter (\(x_i,i)->x_i/=0) (zip (delNull p) [0..])
				--отображение коэффициента при X
				showCoeff c = if c == 1 then "" else show c
				--отображение степени X
				showXPow pow = if pow == 0
                				then ""
                				else
	                				if pow == 1
            						then "x"
            						else "x^" ++ show pow

				--отображение целиком всего многочлена
				revCoeff = reverse coeff
				initRevCoeff = init revCoeff
				lastRevCoeff = last revCoeff
			in	foldr (\(x_i,i) e->show x_i ++"x^"++show i++" + " ++ e) "" initRevCoeff ++ show (fst lastRevCoeff) ++"x^"++show (snd lastRevCoeff)