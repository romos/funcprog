{--
    Task 1
    *Доп.задача до 25.11 (задача с контрольной)*

    Пусть строчка содержит только символы ‘[‘, ‘]‘, ‘(‘ и ‘)‘. Опишите функцию checkBrackets, которая для данной строчки проверяет, что в ней находится правильная скобочная последовательность, и возвращает True или False. 

    Примеры вызова:

    checkBrackets "[()[]]()"
    Результат должен быть равен True.

    checkBrackets "([)]"
    checkBrackets "())[]"
    checkBrackets "([]"
    Результат должен быть равен False.
--}
check b1 b2 = (b2 ++ b1 == "()") || (b2 ++ b1 == "[]")

checkBrackets' [] [] = True
checkBrackets' [] _ = False
checkBrackets' s [] =
    let
      b = [head s]
    in
        if b == ")" || b == "]"
        then False
        else checkBrackets' (tail s) [b]
checkBrackets' s begs =
    let
      b1 = [head s]
      b2 = head begs
    in
        if b1 == "(" || b1 == "["
        then checkBrackets' (tail s) (b1:begs)
        else if check b1 b2
             then checkBrackets' (tail s) (tail begs)
             else False

checkBrackets s = checkBrackets' s []

{--
    Task 2
    *Доп.задача до 25.11 (задача с контрольной)*

    Пусть у нас есть двоичное дерево, элементы которого – символы ‘a’ и ‘b‘. Написать две функции:
    - функция toStr по дереву строит его представление в виде строки – все буквы в этом дереве, и, видимо, какие-то воспомогательные значки. 
    - функция fromStr должна по этой строке восстанавливать исходное дерево.
    Т.е. надо придумать, как двоичное дерево закодировать в виде строки, и написать функции, которые его кодируют и декодируют.

    Пример вызова:

    fromStr(toStr (Node ‘a‘ (Node ‘b‘ Empty Empty) Empty))
    Результат должен быть равен исходному дереву, т.е. Node ‘a‘ (Node ‘b‘ Empty Empty) Empty

    Замечание:
    - Не забудьте написать deriving Show, без этого тесты не пройдут.
--}
data Tree a = Empty | Node a (Tree a) (Tree a) deriving Show

toStr Empty = "e"
toStr (Node c l r) = [c] ++ toStr l ++ toStr r

fromStr' (x:s) =
    if x == 'e' then (Empty, s)
    else
        let
          (l, rest1) = fromStr' s
          (r, rest2) = fromStr' rest1
        in (Node x l r, rest2)

fromStr s = fst (fromStr' s)
