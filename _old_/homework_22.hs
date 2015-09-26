{--
    Task 1
    Определите тип Ration для представления дробей. Конструктор этого типа должен записываться так: Rat <числитель> <знаменатель>.
    Для этого типа: 
    a. Определите оператор + (сложение дробей)
    b. Определите оператор < (сравнение дробей)
    c. Определите функцию show, которая генерирует строковое представление дроби в формате <числитель>/<знаменатель> 

    Примеры вызова:

    Rat 1 2 + Rat 1 7

    Должно быть напечатано

    9/14

    (потому что при выводе автоматически вызовется show) 

    Rat 1 3 < Rat 4 5

    Результат должен быть равен True

    Замечания:
    - Еще обязательно придется определить ==, без этого программа не будет компилироваться.
    - Надо ли сокращать дроби? Например, что будет, если сложить Rat 1 3 и Rat 1 6? 
    Ответ: Как хотите, не обязательно сокращать. В тестах таких примеров не будет.
    - Как должна работать функция show, если знаменатель равен 1 и в других необычных случаях?
    Ответ: Тоже как хотите, тут тоже тесты будут только очень простые. 
--}
data Ration = Rat Integer Integer

instance Num Ration where
    (Rat n1 d1) + (Rat n2 d2) = Rat (n1*d2 + n2*d1) (d1*d2)

instance Ord Ration where
    (Rat n1 d1) < (Rat n2 d2) = if (d1*d2 > 0) then n1*d2 < n2*d1 else n1*d2 > n2*d1

instance Eq Ration where
    (Rat n1 d1) == (Rat n2 d2) = n1*d2 == n2*d1

instance Show Ration where
    show (Rat n d) = show n ++ "/" ++ show d

{--
    Task 2
    Определить функцию allNondivisible, которая проверяет, верно ли что в данном списке нет двух элементов, таких, что один делиться на другой.

    Дополнительное условие: В этой задаче, пожалуйста, обязательно используйте прием с представлением множества с помощью логической функции, который мы разбирали на занятии.

    Примеры вызова:

    allNondivisible [2, 7, 6, 5]

    Результат должен быть равен False, потому что 6 делится на 2

    allNondivisible [4, 7, 6, 5]

    Результат должен быть равен True, потому что ни одно число в списке не делится на другое.

    Замечание: 
    Если совсем непонятно, что это за прием такой, вы можете прислать любое решение этой задачи, а я, в обмен на это, подскажу, как ее делать с этим приемом :)
--}
allNondivisible' [] cond = True
allNondivisible' (x:xs) cond = if not(cond x) then False else allNondivisible' xs (\t -> cond t && t `mod` x /= 0 && x `mod` t /= 0)
allNondivisible xs = allNondivisible' xs (const True)

{--
    Task 3
    Для типа Expr, который мы разбирали на занятии, опишите функцию eval. Эта функция должна вызываться так: eval выражение число. Функция должна вычислять значение выражения при данном значении X.

    Пример вызова:

    eval (Add (N 3) (Mult X X)) 10

    Должно получиться 103
--}
data Expr = X | N Integer | Add Expr Expr | Mult Expr Expr deriving Show

eval X n = n
eval (N n) _ = n
eval (Add s1 s2) n = eval s1 n + eval s2 n
eval (Mult m1 m2) n = eval m1 n * eval m2 n

{--
    Task 4
    Для типа Expr, который мы разбирали на занятии, опишите функцию diff, которая вычисляет производную данного выражения по X.

    diff (Mult X X)

    Должно получиться

    Add (Mult(N 1) X) (Mult X (N 1))

    Замечания:
    - В описании типа надо обязательно в конце написать deriving Show. (На занятии я забыл это сделать :( ). Иначе не удастся вывести результат. 
    - Упрощать выражение не надо. Т.е. не требуется, например, пытаться вместо Add (Mult(N 1) X) (Mult X (N 1)) получить Mult (N 2) X.
--}
--data Expr = X | N Integer | Add Expr Expr | Mult Expr Expr deriving Show

diff X = N 1
diff (N _) = N 0
diff (Add s1 s2) = Add (diff s1) (diff s2)
diff (Mult m1 m2) = Add (Mult (diff m1) m2) (Mult m1 (diff m2))

{--
    Task 5
    Опишите функцию flatten, которая для данного дерева возвращает список из всех значений, записанных в вершинах дерева.

    Пожелание: 
    Было бы замечательно, если бы вы написали реализацию flatten, которая не использует операцию ++. Потому что ++, как мы знаем, работает медленно и flatten получится неэффективным. Но, если не придумаете, подойдет любая реализация, и с использованием ++.

    Пример вызова:

    flatten (Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty))

    Должно получиться

    [1,2,3] 

    Замечание:
    - Желательно, чтобы значения шли в в таком порядке, как в примере (вершина, потом левое поддерево, потом правое поддерево).
--}
data Tree = Empty | Node Integer Tree Tree

flatten' Empty acc = acc
flatten' (Node n l r) acc = n : flatten' l (flatten' r acc)
flatten t = flatten' t []

--flatten (Node 1 (Node 2 (Node 3 Empty Empty) (Node 4 Empty Empty)) (Node 5 (Node 6 Empty Empty) (Node 7 Empty Empty)))

{--
    Task 6
    Пусть нас попросили написать функцию findSame, которая для данного списка возвращает элемент, который в нем встречается больше одного раза. Например, для [1,2,3,2,5] надо вернуть 2.

    Мы, естественно, просим уточнить:
    - Что делать, если таких элементов несколько?
    - Что делать, если таких элементов вообще нет?

    А нам сказали:
    - Если из несколько, можно вернуть любой.
    - Если вообще нет таких элементов - ну, нам сказали, придумайте что-нибудь.. Подойдет любое решение, но надо, чтобы пользователь мог понять, нашлось что-то или нет.

    Задача: придумать интерфейс для findSame и реализовать эту функцию.

    Примеры вызова:

    findSame [1,2,3,2,5]

    Должно получиться что-то на ваше усмотрение, но, видимо это должно быть число 2 и еще м.б. какая-то дополнительная информация.

    findSame [1,3,2,5]

    Должно получиться что-то на ваше усмотрение, но, видимо это должна быть какая-то информация о том, что мы ничего не нашли.

    Замечания:
    - Самый первый вариант, который лично мне приходит в голову - это вернуть пару (число, логическое значение). Это, на самом деле, видимо вовсе не лучший вариант, но вполне нормальный. Если хотите, можете его реализовать, а можете придумать что-то другое.
    - Просто на всякий случай, в этой задаче _не_ требуется использовать прием с представлением множества, как функции. Тут подойдет любая простая реализация. 
--}
data Result a = None | Element a deriving Show

findSame' [] _ = None
findSame' (x:xs) acc = if elem x acc then Element x else findSame' xs (x:acc)
findSame xs = findSame' xs []

{--
    Task 7
    Опишите функцию merge, у которой два параметра - списки, причем мы точно знаем, что эти значения в этих списках строго возрастают. Функция должна вернуть строго возрастающий список, содержащий значения из обеих списков. Если элемент встречается в обеих списках, в результате он должен встречаться только один раз. 

    Пример вызова:

    merge [1,4,8] [2,4,5,10,20]

    Должно получиться

    [1,2,4,5,8,10,20]

    Замечания:
    - Списки могут быть и бесконечными
    - Эта задаче особо ни какой теме не относится - просто полезная функция, которую полезно уметь писать, и которая вполне часто используется на практике
--}
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x == y = x : merge xs ys
    | x > y = y : merge (x:xs) ys
    | otherwise = x : merge xs (y:ys)
