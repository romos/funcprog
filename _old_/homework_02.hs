{--
    Task 1
    *Дополнительная задача*
    Опишите функцию g, которая для данного целого числа, проверяет, можно ли его представить в виде суммы двух различных простых чисел, и возвращает True или False.

    Примеры вызова:
    g 6 должно быть равно False
    g 7 должно быть равно True (так как 7 = 2 + 5).

    Замечание:
    О похожей (но не совсем такой же)задаче написан целый роман см. например: http://royallib.ru/book/doksiadis_apostolos/dyadyushka_petros_i_problema_goldbaha.html
--}
isPrime 1 = False
isPrime 2 = True
isPrime n = isPrime1 n 2

isPrime1 n k
  | k == n - 1 = True
  | mod n k /= 0 = isPrime1 n (k + 1)
  | otherwise = False

g n = g1 n 1
g1 n k
  | k /= n - k && isPrime k && isPrime (n - k) = True
  | k == n = False
  | otherwise = g1 n (k + 1)

{--
    Task 2
    *Дополнительная задача*
    Опишите функцию c n, которая для данного целого числа n вычисляет, сколько есть способов представить данное число, как сумму нескольких различных положительных чисел, причем все числа должны быть попарно взаимно простыми.

    Пример вызова:
    с 10 - должно получиться 6, потому что есть 6 таких последовательностей (1 2 7, 1 4 5, 1 9, 2 3 5, 3 7, 10).

    Замечание: В этой задаче, видимо, не обойтись без списков, которые мы еще пока не проходили - но в ближайший четверг пройдем.

    *Уточнение:* Некоторые участники блестяще доказали, что эту задачу можно и без списков сделать. Замечательно, а я не догадался... 
--}
gcdiv m n
  | m < n = gcdiv n m
  | m == n = n
  | otherwise = gcdiv n (m - n)

-- use standard gcd
c n = c1 n n 1
c1 n max prod
  | n == 0 = 1
  | max == 0 = 0
  | n < max = c1 n n prod
  | gcd max prod == 1 = c1 (n - max) (max - 1) (prod * max) + c1 n (max - 1) prod
  | otherwise = c1 n (max - 1) prod
