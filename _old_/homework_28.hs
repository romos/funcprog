{--
    Task 1
    **Доп.задача до 2.12*

    Опишите функцию findMajor, которая проверяет, есть ли в списке элемент x, который встречается чаще всех других, вместе взятых, и возвращает Just x или Nothing, если такого элемента нет.

    Дополнительное условие: Функция должна работать за линейное время от длины списка, и не должна использовать списки (кроме исходного списка, конечно) или любые другие структуры данных неограниченной длины. Другими словами, должна быть сложность по времени O(n) и сложность по памяти O(1).

    Примеры вызова:

    findMajor [1,2,3,2,2,2,1]
    Результат должен быть равен Just 2

    findMajor [1,2,3,2,2,1]
    Результат должен быть равен Nothing

    Замечания:
    - Это просто более-менее известная задачка на сообразительность, с функциональным программированием никак, в общем то, не связанная.
    - Я лично знаю решение, которое требует два прохода по списку, и только две вспомогательных переменных
    - Интересно, что, если бы задача была найти самое часто встречающееся число, то такое эффективное решение, насколько я понимаю, не существует. 
    Но раз речь идет не о просто самом частом, а об _очень_ часто встречающемся числе, то все получается гораздо эффективнее.
--}
check' [] _ counter = counter > 0
check' (x:xs) y counter = if x == y then check' xs y (counter + 1) else check' xs y (counter - 1)

check _ Nothing = Nothing
check xs (Just x) = if check' xs x 0 then Just x else Nothing

findMajor' [] res _ = res
findMajor' (x:xs) Nothing 0 = findMajor' xs (Just x) 1
findMajor' (x:xs) (Just y) k = if x == y
                               then findMajor' xs (Just y) (k + 1)
                               else if k > 1
                                    then findMajor' xs (Just y) (k - 1)
                                    else findMajor' xs Nothing 0

findMajor xs = check xs (findMajor' xs Nothing 0)

{--
    Task 2
    **Доп.задача до 2.12*

    Опишите тип LogExpr, аналогичный Expr, но для логических выражений. В нем должны быть конструкторы And, Or, Not для логических операций, конструкторы T и F для логических констант и переменная X.

    Определите для этого типа операцию ==, которая проверяет, эквивалентны ли эти выражения.

    Примеры вызова:

    Or X (Not X) == T
    Результат должен быть равен True

    Or X (And X (Not X)) == T
    Результат должен быть равен False
--}
data LogExpr = X | T | F | And LogExpr LogExpr | Or LogExpr LogExpr | Not LogExpr

simplify (And c1 c2) =
    let
      (sc1, flag1) = simplify c1
      (sc2, flag2) = simplify c2
    in if sc1 == F || sc2 == F
       then (F, True)
       else if sc1 == T
            then (sc2, True)
            else if sc2 == T
                 then (sc1, True)
                 else if sc1 == Not sc2 || Not sc1 == sc2
                      then (F, True)
                      else if sc1 == sc2
                           then (sc1, True)
                           else (And sc1 sc2, flag1 || flag2)
simplify (Or d1 d2) =
    let
      (sd1, flag1) = simplify d1
      (sd2, flag2) = simplify d2
    in if sd1 == T || sd2 == T
       then (T, True)
       else if sd1 == F
            then (sd2, True)
            else if sd2 == F
                 then (sd1, True)
                 else if sd1 == Not sd2 || Not sd1 == sd2
                      then (T, True)
                      else if sd1 == sd2
                           then (sd1, True)
                           else (Or sd1 sd2, flag1 || flag2)
simplify (Not (Not le)) = (le, True)
simplify (Not (And le1 le2)) = (Or (Not le1) (Not le2), True)
simplify (Not (Or le1 le2)) = (And (Not le1) (Not le2), True)
simplify (Not T) = (F, True)
simplify (Not F) = (T, True)
simplify e = (e, False)

instance Eq LogExpr where
    X == X = True
    T == T = True
    F == F = True
    (Not le1) == (Not le2) = le1 == le2
    (And le1 le2) == (And le3 le4) = le1 == le3 && le2 == le4
    (Or le1 le2) == (Or le3 le4) = le1 == le3 && le2 == le4
    le1 == le2 = 
        let
          (sle1, flag1) = simplify le1
          (sle2, flag2) = simplify le2
        in if not (flag1 || flag2) then False else sle1 == sle2

{--
    Task 3
    **Доп.задача до 2.12*

    Пусть я хочу найти способы расставить ферзей на шахматной доске, чтобы они друг друга не били.

    Для представления позиции на шахматной доске я использую список пар чисел, каждое число >= 1. Первое число обозначает вертикаль, а второе - горизонталь.

    Еще для единообразия давайте считать, что первый ферзь в списке всегда стоит на первой вертикали, второй ферзь - на второй вертикали и т.д. (Т.е., вообще-то хранить вертикали в списке не очень то надо, но для наглядности мы их храним).

    И вот задача:

    Описать функцию queens с двумя параметрами n и k, которая возвращает список из способов расставить k ферзей на доске с n горизонталями и k вертикалями, чтобы они не били друг друга.

    Дополнительное условие: Тут надо обязательно использовать прием "представление множества с помощью функции".

    Пример вызова:
    queens 3 2

    Должно получиться:
    [[(1,1),(2,3)],[(1,3),(2,1)]]

    (не обязательно именно в таком порядке).

    Замечания:
    - Мне кажется задача очень похожа на задачу 27-1. Просто в 27-1 функция проверки попроще, а тут посложнее. 
    - Если не очень понятно о чем речь, но хочется разобраться - пишите, пожалуйста, я подскажу. 
--}
queens' n 0 = [([], \_ _ -> False)]
queens' n k = [((k, i):xs, \a b -> b == i || check a b || abs (a - k) == abs (b - i)) | (xs, check) <- queens' n (k - 1), i <- [1..n], not (check k i)]

queens n k = map (\(xs, _) -> xs) (queens' n k)

