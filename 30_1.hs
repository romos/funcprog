{--
Задача 30-1
Одеров Роман, 545 гр.
--}

{-
Идея в симуляции глобального стека для хранения открывающих скобок (здесь это второй параметр функции)

-}
checkBrackets s = chBr s []

chBr s stack
	|s == [] && stack == [] = True
	|s == [] && stack /= [] = False
	|otherwise =
				let
					br = [head s]
				in
					if br == ")" || br == "]"
					then
						if stack == []
						then False
						else
							let
								br_begin = head stack
							in
								if ((br_begin)++(br) == "()") || ((br_begin)++(br) == "[]")
								then chBr (tail s) (tail stack)
								else False
					else
						chBr (tail s) ((br):stack)
