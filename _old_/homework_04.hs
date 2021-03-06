{--
    Task 1
    *Доп.задача*
    Написать функцию parts, которая для данного списка проверяет, можно ли его разбить 
    на несколько строго возрастающих кусков одинаковой длины. 

    Длина кусков должна быть не меньше 2. Кусок может быть и только один.

    Примеры вызова:
    parts [1, 2, 8, 2, 5, 6]
    parts [1, 2, 3, 4, 5]
    parts [1, 2, 1, 2, 3, 4]
    Во всех этих случаях ответ должен быть равен True.
    parts [4, 6, 3, 5, 7]
    Тут ответ должен быть равен False.
--}
parts (x:xs) = partss xs x 2

partss [] _ _ = True
partss (x:xs) y lenToCheck
  | partss1 (x:xs) y (lenToCheck - 1) lenToCheck = True
  | x > y = partss xs x (lenToCheck + 1)
  | otherwise = False

partss1 [] _ curLen lenToCheck
  | curLen == lenToCheck = True
  | otherwise = False
partss1 (x:xs) y curLen lenToCheck
  | curLen == lenToCheck = partss1 xs x 1 lenToCheck
  | x > y = partss1 xs x (curLen + 1) lenToCheck
  | otherwise = False

{--
    Task 2
    *Доп.задача, немного посложнее, но не очень сложная, мне кажется*
    Написать функцию parts2, которая проверяет, можно ли в данном списке выбрать ровно половину элементов, чтобы
    - они строго возрастали
    - в оставшейся половине элементы тоже строго возрастали.
    В этой задаче элементы не обязательно брать подряд.

    Примеры вызова:
    parts2 [1, 3, 1, 8, 4, 9]
    Ответ должен быть True (разбивается, например, на 
    [1, 3, 4] и [1, 8, 9])
    parts2 [1, 2, 3, 5, 1, 7]
    ответ должен быть False.

    Замечания:
    - просто на всякий случай, если присланное решение покажется мне очень неэффективным, я могу попросить его улучшить, даже если всегда дает правильные результаты 
    - честно говоря, я не знаю, какое в этой задаче лучшее решение. Присылайте ваши варианты, обсудим) 
--}



{-Ф-ция parts2' <xs> <prev1> <prev2> <l1> <l2> <maxl>
        xs = оставшийся список, подлежащий распределению по двум подспискам
        prev1 и prev2 = последние элементы подсписков (в силу условия возрастания, в список НЕЛЬЗЯ брать элементы МЕНЬШЕ предыдущего)
        l1 и l2 = длины подсписков. Должны быть равны ПОЛОВИНЕ ЭЛЕМЕНТОВ исходного списка 
        maxl = Число, половина количества элементов исходного списка
-}
{-если количество элементов заведомо нечетно, то раскладывать не имеет смысла.
  иначе первый элемент "кидается" в любой список (первый по умолчанию).
  Далее бежим по списку и раскидываем элементы туда, куда подходят.  
  Для пустого второго списка минимальное значение = -(бесконечность)
-}

parts2 (x:xs) = if (mod (length (x:xs)) 2 == 0) then parts2' xs x (-1/0) 1 0 (div (length (x:xs)) 2) 
                else False
parts2' [] _ _ l1 l2 _ = l1 == l2 -- Когда закончили разбирать список, проверяем одинаковое количество элементов в подсписках

parts2' (x:xs) prev1 prev2 l1 l2 maxl =
  if (l1>maxl || l2>maxl) then False --если набрали больше половины элементов, False
  else
    --если следующий элемент можно поместить в любой из двух подсписков, учитываем оба варианта
    if (x>prev1 && x>prev2) then parts2' xs x prev2 (l1+1) l2 maxl || parts2' xs prev1 x l1 (l2+1) maxl
    else
      --если подходит только в один подсписок, добавляем его туда (далее 2 случая в зависимости от подходящего списка):
      if (x>prev1) then parts2' xs x prev2 (l1+1) l2 maxl
      else
        if (x>prev2) then parts2' xs prev1 x l1 (l2+1) maxl
        else False -- если никуда не подходит, False