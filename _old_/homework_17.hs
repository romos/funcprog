{--
    Task 1
    Описать функцию bigSin c параметром x, которая возвращает первый элемент в последовательности
    sin 1, sin 2, sin 3, sin 4, ...
    , который больше или равен x. 

    Дополнительное условие: нельзя определять свои функции (кроме bigSin, конечно). Можно использовать любые стандартные функции и лямбда выражения.

    Пример вызова:
    bigSin 0.99
    результат должен быть равен примерно 0.990607

    Замечания:
    - очевидная подсказка: тут, конечно, удобно использовать бесконечные списки. Но можно и без них, наверное.
--}
bigSin x = head (filter (>=x) (map sin [1..]))

{--
    Task 2
    Описать функцию myFilter - свою реализацию функции filter c точно таким же интерфейсом.
    Дополнительное условие: эта реализация должна использовать только функцию foldr и лямбда выражения.

    Пример вызова:
    myFilter (>0) [1,-2,3,-5]
    результат должен быть равен [1,3]
--}
myFilter f xs = foldr (\x res -> if f x then x:res else res) [] xs

{--
    Task 3
    a. Опишите функцию approxSum, параметр который - бесконечный список и которая считает сумму входящих в него элементов, пока очередной элемент не станет по модулю меньше 0.000001.

    б. Используя approxSum, сосчитайте приближенную сумму ряда 1/1 + 1/4 + 1/9 + ... + 1/(i*i) + ...
    Значение этой приближенной функции присвойте переменной z.

    Пример вызова:
    z
    Должно получиться примерно 1.64
--}
approxSum' [] e = 0
approxSum' (x:xs) e = if abs x < e then 0 else x + approxSum' xs e
approxSum xs = approxSum' xs 0.000001

z = approxSum [1/i^2 | i <- [1..]]

{--
    Task 4
    Пусть в списке я записал последовательность чисел - сколько денег я тратил каждый день в этом году. Запись я начал, конечно же, с понедельника. 

    Опишите функцию weekendExpences у которой параметр - такой список расходов, и которая вычисляет для него общую сумму расходов по выходным.

    Пример вызова:
    weekendExpences [3,1,4,12,3,5,17,6,7,7,8,18,5,1, 3]

    Ответ должен быть равен 5+17+5+1 = 28.

    Замечание:
    - В этой задаче можно (но не обязательно) использовать зацикленный список
--}
mask = 0:0:0:0:0:1:1:mask
weekendExpences xs = sum (zipWith (*) xs mask)

{--
    Task 5
    Опишите бесконечный список fibs, состоящий из чисел Фибоначчи.
    Дополнительное условие: желательно использовать прием "завязывание в узел" (tying the knot). Но, если не получится, можно решить эту задачу любым способом.

    Пример вызова:
    take 10 fibs

    Результат должен быть равен:
    [1,1,2,3,5,8,13,21,34,55]

    Замечание:
    - Безусловно эту задачу можно найти в интернете - и решение из интернета тоже засчитается. Но мне кажется интереснее попробовать самим что-то придумать, тем более это совсем и не сложно..
--}
fibs = 1:1:(zipWith (+) fibs (tail fibs))

{--
    Task 6
    Используя функцию foldTree с последнего занятия (второй вариант, который катаморфизм), опишите функцию sumPos. У этой функции параметр - дерево, и она должна вычислять сумму всех положительных чисел в этом дереве.

    Пример вызова:
    sumPos (Node 3 (Node (-1) Empty Empty) (Node 4 Empty Empty))
    Ответ должен быть равен 7.
--}
data Tree = Empty | Node Integer Tree Tree

foldTree f e Empty = e
foldTree f e (Node x l r) =
    let
      lres = foldTree f e l
      rres = foldTree f e r
    in f x lres rres

sumPos t = foldTree (\x lres rres -> if x > 0 then x + lres + rres else lres + rres) 0 t

{--
    Task 7
    В этой задаче надо прислать не программу, а просто текст.
    a. Напишите, какой тип у функции foldr (если хотите, можете посмотреть, а можете сами попробовать придумать)
    б. Расскажите, как можно вывести этот тип, используя определение foldr - примерно так, как мы это делали на занятии для map. Т.е. в этой задаче надо показать, неформально, как для foldr работает алгоритм Хиндли-Милнера.

    Замечания:
    - текст foldr, на основании которого надо вывести тип, был у нас на занятии
    - если не очень понятно, что тут все-таки надо делать, пишите, обсудим.
--}
{--
foldr :: (a -> b -> b) -> b -> [a] -> b

foldr f e [] = e
foldr f e (x:xs) = f x (foldr f e xs)

фаза 1.
a1 -> a2 -> a3 -> a4

фаза 2.
(x:xs) имеет тип a3 => a3 = [a5]
f x (foldr f e xs) => f функция с двумя арументами => a1 = a6 -> a7 -> a8
итог: foldr :: (a6 -> a7 -> a8) -> a2 -> [a5] -> a4

фаза 3.
из первого правила видно, что e есть и в параметрах, и в результате => a2 = a4
x встречается в (x:xs) типа [a5] => a6 = a5
foldr f e xs - вызов foldr с типом результата a4 => a7 = a4
f x (foldr f e xs) - результат работы f, т.е. a8, и результат работы foldr, т.е. a4 => a8 = a4
итог: foldr :: (a5 -> a4 -> a4) -> a4 -> [a5] -> a4
--}
{--
    Task 8
    Опишите класс Shape и типы Circle и Rect, как мы это делали на занятии. Добавьте в класс функцию perimeter и для Circle и Rect напишите ее определение.

    Примеры вызова:
    perimeter (Circle 10)
    Ответ должен быть равен примерно 62.83
    perimeter (Rect 3 7)
    Ответ должен быть равен 20
--}
data Rect = Rect Double Double
data Circle = Circle Double

class Shape a where
    perimeter :: a -> Double

instance Shape Rect where
    perimeter (Rect x y) = 2*x + 2*y

instance Shape Circle where
    perimeter (Circle r) = 2*pi*r

