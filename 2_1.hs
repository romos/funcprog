{--
Задача 2-1*
Одеров Роман, 545 гр.
--}

{-
Цель: последовательный перебор возможных слагаемых, начиная с 2 и заканчивая n/2 (т.к. сумма коммутативна).
	На каждом шаге проверять, являются ли слагаемые простыми.
-}

g n = g' 2 (n-2)
g' a1 a2 = if (a1>=a2)		-- если первое слагаемое больше второго (либо равно ему), то заведомо False, 
						-- т.к. сумма коммутативна. Следовательно, мы уже 0перебрали все возможные варианты и не нашли подходящего
			then False
			else
				if (prime a1 && prime a2)	-- проверяем, являются ли слагаемые простыми.
				then True					-- Если да, то возвращаем True
				else g' (a1+1) (a2-1)		-- Если нет, то переходим к следующей паре слагаемых.

--Функция, проверяющая простоту числа
prime 1 = True
prime 2 = True
prime a = prime' 2 a 	--последовательно ищем разложение на множители (начиная с 2) и проверяем их на простоту
prime' a b = if (a==b) 	-- в этом случае мы дошли до самого числа, т.е. нашли разложение a = a * 1. Значит, a - простое.
			 then True
			 else 
			 	if (mod b a == 0) 	-- если a делится на b, то это признак "непростоты" числа
				then False
				else prime' (a+1) b	-- если не делится, то продолжаем поиск