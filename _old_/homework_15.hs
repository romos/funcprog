{--
    Task 1
    *Доп. задача, до 28.10*

    Описать бесконечный список cantor , содержащий все пары целых положительных чисел (каждую по одному разу).

    Пример вызова:
    take 100 cantor

    Что получится, не могу сказать, потому что вы можете выбирать разные порядки обхода, но, например, что-то вроде [(1,1), (1,2), (2,2), (2,1), (1,3) и т.д.
--}
calcDiag n = calcDiag' n 1
calcDiag' n k
  | n <= (k*(k+1)) `div` 2 = k
  | otherwise = calcDiag' n (k + 1)

cantor' n = 
  let
    k = calcDiag n
    m = ((k-1)*k) `div` 2
    x = n - m
    y = k - x + 1
  in ((x, y)) : cantor' (n + 1)
cantor = cantor' 1

{--
    Task 2
    *Доп. задача, до 28.10*

    Описать функцию ganeralizedCantor с одним параметром n, которая возвращает бесконечный список, содержащий все возможные списки из n целых положительных чисел (каждый список по одному разу).

    Пример вызова:
    take 100 (generalizedCantor 3)

    Что при этом получится, не могу сказать, потому что вы можете выбирать разные порядки обхода, но начало, видимо, будет [[1,1,1], [1,1,2], и т.д.
--}
expand n 1 = [[n]]
expand n k = [x : ys | x <- [1..(n - k + 1)], let yss = expand (n - x) (k - 1), ys <- yss]
expandList k = [(xs, length xs) | n <- [k..], let xs = expand n k]

getIndex n k = getIndex' n k 0 1
getIndex' n k ind acc
  | n - acc <= 0 = (ind, acc - n)
  | otherwise = getIndex' n k (ind + 1) (acc + snd (expandList k !! (ind + 1)))

genCantor n k =
  let
    (ind1, ind2) = getIndex n k
  in ((fst (expandList k !! ind1)) !! ind2) : (genCantor (n + 1) k)

generalizedCantor k = genCantor 1 k
