{--
    Task 1
    В этой задаче надо реализовать сразу две функции: 
    а. Напишите функцию sumDiv, которая для данного целого положительного числа возвращает сумму всех его делителей, не считая сам это число.
    б. Напишите функция perfects n, которая возвращает список всех совершенных чисел, меньших или равных n.

    Примеры вызова:
    sumDiv 10
    Ответ должен быть равен 8 (так как 1+2+5=8)
    perfects 1000
    Ответ должен быть равен
    [6,28,496]

    Справка: Число называется совершенным, если оно равно сумме своих делителей.
--}

sumDiv n = foldr (\(q,w) res -> res + q + w) 0 [(x, n `div` x) | x <- [1..(truncate (sqrt (fromIntegral n)))], n `mod` x == 0] - n
perfects n = [m | m <- [2..n], sumDiv m == m]

{--
primeDegrees n p = primeDegrees' n p 0
primeDegrees' n p deg
  | n `mod` p^deg == 0 = primeDegrees' n p (deg + 1)
  | otherwise = reverse [p^d | d <- [0..(deg - 1)]]

sumDiv n = sumDiv' n 2 - n
sumDiv' n p
  | n `mod` p == 0 = 
    let
      ps = primeDegrees n p
      sumD = sumDiv' (n `div` (head ps)) (p + 1)
    in foldr (\t res -> res + t * sumD) 0 ps
  | p < n `div` p = sumDiv' n (p + 1)
  | n == 1 = 1
  | otherwise = n + 1

perfects n = [m | m <- [1..n], sumDiv m == m]
--}

{--
    Task 2
    Напишите функция amicables n, которая возвращает список всех пар дружественных чисел, каждое из которых меньше или равно n. 
    Пример вызова:
    amicables 1000
    Ответ должен быть равен
    [(220,284)]

    Справка: Числа a и b называется дружественными, если a равно сумме делителей b, а b равно сумме делителей a.

    Замечания: 
    - Для единообразия давайте включать в список только те пары, в которых первое число меньше второго.
    - Видимо, имеет смысл скопировать и использовать функцмю sumDiv из задачи 14-1
--}
amicables n = [(x, y) | x <- [1..n], let y = sumDiv x, x < y, sumDiv y == x]

{--
    Task 3
    Опишите переменную fives, как бесконечный список [5,55,555,5555,...] - т.е. список из целых положительных чисел, у которых все цифры равны 5.

    Пример вызова:
    take 7 fives
    Ответ должен быть равен:
    [5,55,555,5555,55555,555555,5555555]
--}
fives' n =
  let
    n1 = n * 10 + 5
  in n1 : fives' n1
fives = fives' 0

{--
    Task 4
    Опишите функцию foldTree, которая для дерева делает что-то аналогичное foldr или foldl для списков.

    Т.е. задача написать что-то, что позволяет искать
    сумму, произведение и т.д. для всех элементов дерева. На самом деле это можно сделать разными
    способами. 

    а. Например, можно написать функцию foldTree, которая вызывается
    как-то так:

    foldTree (+) 0 t — ищет сумму всех элементов в дереве
    foldTree (*) 1 t — ищет произведение всех элементов в дереве

    б. Но м.б. можно придумать что-то более общее? Например, придумать такой вариант foldTree, который позволяет реализовывать более сложные функции (например, искать высоту дерева и т.д.). Если придумаете, предложите какой-нибудь такой вариант.

    Замечания:
    - Условие, естественно, не совсем строгое (но так и в жизни часто бывает..). Если есть вопросы - пишите.
    - Пункт б. необязательный (хотя и не особо сложный). Решения, описанного в пункте а. тоже вполне достаточно. 
    - В этой задаче, естественно, тестов не будет. Желательно, чтобы вы включили в текст 2-3 примера того, как можно использовать программу.
--}
data Tree = Empty | Node Integer Tree Tree
foldTree f e Empty = e
foldTree f e (Node i l r) = foldTree f (foldTree f (f i e) l) r

--foldTree (*) 1 (Node 1 (Node 1 Empty Empty) (Node 3 Empty Empty))
--foldTree (+) 0 (Node 2 (Node 3 Empty Empty) (Node 4 Empty Empty))

foldTree' f e Empty = e
foldTree' f e (Node i l r) = f i (foldTree' f e l) (foldTree' f e r)

--foldTree' (\t l r -> l*t*r) 1 (Node 1 (Node 1 Empty Empty) (Node 3 Empty Empty))
--foldTree' (\t l r -> l+t+r) 0 (Node 2 (Node 3 Empty Empty) (Node 4 Empty Empty))
--foldTree' (\_ l r -> max l r + 1) (-1) (Node 2 (Node 3 Empty Empty) (Node 4 Empty Empty))

