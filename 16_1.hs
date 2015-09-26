{--
Задача 16-1
Одеров Роман, 545 гр.
--}


{-
Представим график. Перечисление элементов по диагоналям.
/\
|
|  '
|  '  '
|  '  '  '
|__'__'__'__'____>

-}


cantor = cantor' 1

{-	по порядковому номеру числа в таком перечислении можно узнать, чему оно равно.
-}
cantor' n =	let
				(d,count) = diagNum_AND_elCount n --номер диагонали, содержащей n-ый элемент списка, и количество элементов с 1 по эту диагональ.
				x = n - (count-d)	-- отсчитываем смещение от первого числа в этой диагонали (в позициях). Это и будет координата x.
				y = -x + d+1 		-- из уравнения прямой y = -x + b, где b = d+1 (т.к. d-ая диагональ пересек. ось OX в точке d+1)
			in ((x,y)):cantor' (n+1)



{-	посчитать номер диагонали, в которой лежит n-ый элемент списка.
	Нужно читать последовательно, сколько элементов получается в сумме от первой диагонали до какой-то.
	Если n становится меньше либо равно этому числу, то мы нашли диагональ - текущая. 
-}
diagNum_AND_elCount n = diagNumber' n 1
diagNumber' n k = 	let
						count = (k*(k+1)) `div` 2 -- количество элементов с 1-ой диагонали (1 элемент) по текущую, k-ую (k элементов), включительно
					in
						if n <= count then (k,count) else diagNumber' n (k+1)