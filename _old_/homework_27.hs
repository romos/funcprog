{--
    Task 1
    Описать функцию allDiffLists с двумя параметрами n и k, которая возвращает список из всех списков длины k, которые можно составить из чисел 1..n, и в которых все числа разные.

    Дополнительное условие: Тут надо обязательно использовать прием "представление множества с помощью функции".

    Пример вызова:
    allDiffLists 3 2

    Должно получиться:
    [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]

    (не обязательно именно в таком порядке).

    Замечание:
    - Мы эту задачу решили на последнем занятии, только без приема "представление множества с помощью функции". Т.е. это, на самом деле, довольно простое упражнение: переписать существующее решение с этим приемом.
--}
allDiffLists' _ 0 _ = [[]]
allDiffLists' n k check = [ (i:xs) | i <- [1..n], not (check i), xs <- allDiffLists' n (k-1) (\t -> check t || t == i)]

allDiffLists n k = allDiffLists' n k (const False)

{--
    Task 2
    Для типа Expr написать функцию simplify. Эта функция должна упрощать выражение, используя только два очень простых правила:

    выражение * 0 = 0
    и
    0 * выражение = 0

    Примеры вызова:

    simplify (Add (Mult X (N 0)) X)

    Должно получиться:
    Add (N 0) X

    simplify (Mult X (Mult X (N 0)))

    Должно получиться:
    N 0

    Замечание:
    - Не забудьте написать deriving Show
--}
data Expr = X | N Integer | Add Expr Expr | Mult Expr Expr deriving (Eq, Show)

simplify (Add s1 s2) = Add (simplify s1) (simplify s2)
simplify (Mult m1 m2) =
    let
      sm1 = simplify m1
      sm2 = simplify m2
    in if sm1 == N 0 || sm2 == N 0 then N 0 else Mult sm1 sm2
simplify e = e

{--
    Task 3
    Опишите функцию findMajor, которая для данного списка определяет, есть ли в нем элемент, который больше суммы всех остальных, вместе взятых, и, если есть, возвращает его, как результат.

    Для того, чтобы сообщить, есть такой элемент или нет, используйте стандартный тип Maуbe, который мы проходили на последнем занятии.

    Примеры вызова:

    findMajor [2,3,15,2,2,2] 

    Должно получиться:
    Just 15

    findMajor [2,3,5,2,4] 

    Должно получиться:
    Nothing

    Замечания:
    - Тут никаких хитростей, это простое упражнение на использование Maybe
--}
findMajor xs = findMajor' xs (sum xs)
findMajor' [] _ = Nothing
findMajor' (x:xs) s = if 2 * x > s then Just x else findMajor' xs s

{--
    Task 4
    На занятии мы разобрали функцию find, использующую failure continuation параметр, для того чтобы сообщить, что ничего не найдено. 

    Используя только эту функцию, описать функцию findInLists, которая ищет элемент, удовлетворяющий данному условию в списке списков.

    Примеры вызова:

    findInLists [[1,8,2], [2,7]] (>5) 0

    Результат должен быть равен 8.

    findInLists [[1,8,2], [2,7]] (>10) 0

    Результат должен быть равен 0.

    Замечание: 
    Желательно в программе не использовать оператор if. Потому что, как мы говорили, при использовании failure continuation он, как правило, не нужен. Функция find, в каком-то смысле, сама работает, как оператор if. 
    Но, если так не получиться, в принципе использовать if можно.
--}
find cond [] err = err
find cond (x:xs) err = if cond x then x else find cond xs err

findInLists [] _ err = err
findInLists (xs:xss) cond err = find cond xs (findInLists xss cond err)

{--
    Task 5
    При помощи оператора >>= для списков описать функцию doubleEven, которая в данном списке все элементы, делящиеся на 2, повторяет два раза, а остальные оставляет, как есть.

    Пример вызова:

    doubleEven [1, 2, 6, 3]

    Должно получиться:
    [1,2,2,6,6,3]
--}
doubleEven xs = xs >>= \x -> if x `mod` 2 == 0 then [x, x] else [x]

{--
    Task 6
    Описать функцию cartesian, которая для двух списков возвращает список из всех возможных пар элементов из первого и второго списка. Т.е. для списков [x1, x2, x3] и [y1, y2, y3] функция должна вернуть [(x1, y1), (x1, y2), (x1, y3), (x2, y1), (x2, y2), …] (всего 9 пар).

    При этом желательно использовать только оператор >>= и лямбда выражения. Можно, но не очень нужно, определять вспомогательные функции. 

    Если не получится сделать задачу с помощью >>=, можно написать любым способом, но только не используя list comprehension (с ним это уж слишком просто).

    Пример вызова:

    cartesian [1,2] [3,4]

    Должно получиться:
    [(1,3),(1,4),(2,3),(2,4)]
--}
cartesian xs ys = xs >>= \x -> ys >>= \y -> [(x, y)]

