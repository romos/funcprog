{--
    Task 1
    *Доп.задача, до 18.11*

    Опишите ham - бесконечную последовательность, состоящую из целых чисел вида 3^i*10^j (где i, j - целые неотрицательные числа), расположенных в порядке возрастания.

    Дополнительное условие: функция должна работать более-менее быстро. Скажем, надо, чтобы за 30 секунд можно было вычислить элемент с номером 10000.

    Примеры вызова:

    take 10 ham

    Должно получиться 

    [1,3,9,10,27,30,81,90,100,243]

    ham !! 10000

    Должно получиться 

    8862938119652501095929000000000000000000000000000000000000000000000000000000000000000000000000000
--}
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x == y = x : merge xs ys
    | x > y = y : merge (x:xs) ys
    | otherwise = x : merge xs (y:ys)

ham = 1 : merge (map (*3) ham) (map (*10) ham)

{--
    Task 2
    *Доп.задача, до 18.11*

    Опишите для типа "электрическая схема" функцию show так, чтобы она наглядно изображала схему в виде резисторов, соединенных проводами, с помощью символов псевдографики (например, с помощью -, |, +).

    Справка: В строках Haskell можно использовать символ backslash n для перехода на следующую строку. Можно, при желании, использовать запись backslash x шестнадцатиричное число для того, чтобы задавать любые символы. 

    (Пояснение: backslash - это такой символ, после него надо писать n или x и цифры подряд. Просто система тестирования плохо относится к backslash в тексте :( ) 

    За эту задачу будет записано 3 балла.
--}
data Scheme = Resistance Integer | Parallel Scheme Scheme | Sequential Scheme Scheme

numberOfDigits n = if n < 10 then 1 else 1 + numberOfDigits (n `div` 10)

generateString c n = foldr (\t res -> res ++ c) "" [1..n]

schemeDimentions (Resistance n) = (1, 2 + numberOfDigits n)
schemeDimentions (Sequential s1 s2) =
    let
      (height1, width1) = schemeDimentions s1
      (height2, width2) = schemeDimentions s2
    in (max height1 height2, width1 + width2)
schemeDimentions (Parallel s1 s2) =
    let
      (height1, width1) = schemeDimentions s1
      (height2, width2) = schemeDimentions s2
    in (1 + height1 + height2, 4 + max width1 width2)

prepareStrings strings from to1 to2 input =
    let
      first = if input then "-+" else "+-"
      last = if input then " +" else "+ "
      doubleSpaces = "  "
      other = if input then " |" else "| "
    in [if k == from
        then curString ++ first
        else if k == to1
             then curString ++ last
             else if k > from && k < to1
                  then curString ++ other
                  else if k > to1 && k < to2
                       then curString ++ doubleSpaces
                       else curString
       | k <- [0..length strings - 1], let curString = strings !! k]

show' (Resistance n) (beginRow, width, height) strings =
    let
      (_, exactWidth) = schemeDimentions (Resistance n)
      cabel = generateString "-" (width - exactWidth)
      spaces = generateString " " width
    in [if k == beginRow
        then curString ++ "-" ++ show n ++ "-" ++ cabel
        else if k > beginRow && k < beginRow + height
             then curString ++ spaces
             else curString
       | k <- [0..length strings - 1], let curString = strings !! k]

show' (Sequential s1 s2) (beginRow, width, height) strings =
    let
      (_, width1) = schemeDimentions s1
    in show' s2 (beginRow, width - width1, height) (show' s1 (beginRow, width1, height) strings)

show' (Parallel s1 s2) (beginRow, width, height) strings =
    let
      (height1, _) = schemeDimentions s1
      preparedStrings = prepareStrings strings beginRow (beginRow + height1 + 1) (beginRow + height) True
      printedS1 = show' s1 (beginRow, width - 4, height1 + 1) preparedStrings
      printedS2 = show' s2 (beginRow + height1 + 1, width - 4, height - height1 - 1) printedS1
    in prepareStrings printedS2 beginRow (beginRow + height1 + 1) (beginRow + height) False

instance Show Scheme where
    show s =
        let
          (height, width) = schemeDimentions s
        in foldr (\string res -> res ++ string ++ "\n") "" (show' s (0, width, height) ["" | k <- [1..height]])

--Sequential (Parallel (Parallel (Sequential (Resistance 1) (Sequential (Resistance 1) (Resistance 1))) (Sequential (Resistance 2) (Resistance 2))) (Parallel (Sequential (Resistance 3) (Resistance 4)) (Resistance 4))) (Parallel (Parallel (Resistance 1) (Resistance 2)) (Parallel (Resistance 3) (Resistance 444444444444444444)))

{--
data Res = R Integer | Serial Res Res | Parallel Res Res

numlen x = if x == 0 then 0 else 1 + numlen (div x 10)

-- Returns width of the image.
width (R x) = numlen x + 2
width (Serial r1 r2) = width r1 + width r2 + 3
width (Parallel r1 r2) = max (width r1) (width r2) + 2

-- Returns height of the image.
height (R x) = 1
height (Serial r1 r2) = max (height r1) (height r2)
height (Parallel r1 r2) = height r1 + height r2 + 1

-- Returns a list containing n copies of x.
copy x 0 = []
copy x n = x : copy x (n-1)

-- Returns a string of n copies of t.
copystr t n = foldr (++) "" (copy t n)

-- Returns strings of list concatenated via newline.
join list = foldr (\x y -> x++"\n"++y) "" list

-- Returns string padded with t to length w.
addstr t w line = line ++ (copystr t (w - length line))
addspace = addstr " "

-- Returns lines with a string s starting from position (h, w) while filling with t.
addx s t 0 w [] = []
addx s t 0 w (line:lines) = ((addstr t w line) ++ s) : lines
addx s t h w (line:lines) = line : addx s t (h-1) w lines

-- Functions to draw plus sign and minus sign.
addPlusDash = addx "+" "-"
addPlusSpace = addx "+" " "
addMinus = addx "-" " "

-- Draw a vertical line of height hei starting from (h, w).
drawvert 0 0 w lines = lines
drawvert hei 0 w (line:lines) = ((addspace w line) ++ "|") : drawvert (hei-1) 0 w lines
drawvert hei h w (line:lines) = line : drawvert hei (h-1) w lines

-- Skip h lines so the actual drawing starts on the first row.
show1 x 0 w lines = show2 x w lines
show1 x h w (line:lines) = line : show1 x (h-1) w lines

show2 (R x) w (line:lines) = ((addspace w line) ++ "-" ++ (show x) ++ "-") : lines

show2 (Serial r1 r2) w lines =
	addMinus 0 (w+w12-1) (
		show2 r2 (w+w1+2) (
			addMinus 0 (w+w1+1) (
				show2 r1 (w+1) (
					addMinus 0 w (
						lines)))))
	where
		w1 = width r1
		w12 = width (Serial r1 r2)

show2 (Parallel r1 r2) w lines =
	addPlusDash (h1+1) (w+w12-1) (
		show1 r2 (h1+1) (w+1) (
			addPlusSpace (h1+1) w (
				drawvert h1 1 (w+w12-1) (
					addPlusDash 0 (w+w12-1) (
						show2 r1 (w+1) (
							drawvert h1 1 w (
								addPlusDash 0 w (
									lines))))))))
	where
		h1 = height r1
		w12 = width (Parallel r1 r2)

instance Show Res where
	show x = join (show1 x 0 0 (copy "" (height x)))
--}
