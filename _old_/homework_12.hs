{--
    Task 1
    *Доп.задача, до 21.10*
    Описать функцию allLists с двумя параметрами n и k, которая возвращает список из всех списков длины k, которые можно составить из чисел 1..n. 

    Пример вызова:
    allLists 3 2

    Должно получиться:
    [[1,1],[1,2],[1,3],[2,1],[2,2],[2,3],[3,1],[3,2],[3,3]]

    (не обязательно именно в таком порядке).

    Замечания:
    - В общем случае в списке должно быть, понятно, n^k элементов.
    - Эта задача, мне кажется, совсем не сложная
    Подсказка: Я бы советовал использовать list comprehension, получится очень просто.
--}
allLists n 0 = [[]]
allLists n k = [(x:xs) | x <- [1..n], xs <- allLists n (k - 1)]

{--
    Task 2
    *Доп.задача, до 21.10*

    Описать функцию canMakeScheme с двумя параметрами:
    - список целых чисел [r1, r2, … rn]. Этот список задает набор имеющихся у нас сопротивлений.
    - целое число m. 
    Функция должна проверить, можно ли построить из этих сопротивлений (не обязательно из всех) электрическую схему с общим сопротивлением m и вернуть в качестве результата True или False. 
    Саму схему строить не надо.

    Пример вызова:
    canMakeScheme [4,4,5] 7

    Ответ должен быть True, потому что мы можем соединить параллельно 4 и 4, а потом присоединить последовательно 5.

    Замечание:
    - Можно считать, что сопротивлений будет не больше 5.
    - Если вы напишете решение, которое работает за разумное время (скажем, за 15 мин.) для 9 резисторов, выложите ее, как решение задачи 12-3, за нее будет 3 балла.
    - Если вы напишите решение, которое работает для 15 резисторов, присылайте мне, за нее будет 20 баллов (но я не думаю, что это возможно..). 
--}

removeValueFromList (x:xs) v
  | x == v = xs
  | otherwise = x : removeValueFromList xs v

removeValuesFromList xs [] = xs
removeValuesFromList xs (v:vs) = removeValuesFromList (removeValueFromList xs v) vs

generateAllPairs [] = []
generateAllPairs (x:xs) = (foldr (\y res -> [x, y] : res) [] xs) ++ (generateAllPairs xs)

generateSetsForNextStep xs =
    let
      f [x, y] res =
        let
          ys = removeValuesFromList xs [x, y]
        in ((x + y) : ys) : ((x*y/(x + y)) : ys) : res
    in foldr f [] (generateAllPairs xs)

generateAllAchievableResistance [] = []
generateAllAchievableResistance [r] = [r]
generateAllAchievableResistance [x, y] = [x, y, x + y, x*y/(x+y)]
generateAllAchievableResistance xs = foldr (\ys res -> generateAllAchievableResistance ys ++ res) [] (generateSetsForNextStep xs)

contains xs x = foldr (||) False (map (==x) xs)

canMakeScheme rs r = contains (generateAllAchievableResistance rs) r

{--
    Task 3
    *Доп.задача, до 21.10*
    Условие см. в задаче 12-2, задача должна работать для 9 сопротивлений. (Таких тестов в системе нет, но я проверю вручную). 
--}

-- control stack overflow, lol
-- works slower, lol
{--
removeValueFromList (x:xs) v
  | x == v = xs
  | otherwise = x : removeValueFromList xs v

removeValuesFromList xs [] = xs
removeValuesFromList xs (v:vs) = removeValuesFromList (removeValueFromList xs v) vs

powerset [] = [[]]
powerset (x:xs) = 
    let
      ys = powerset xs
      ts = map (\qs -> (x:qs)) ys
    in ts ++ ys

generateSubsetsUpToLength xs len = filter (\ys -> length ys <= len) (powerset xs)

removeDuplicates [] = []
removeDuplicates (x:xs) = x : (removeDuplicates (filter (/=x) xs))

calculateAllResistancesByMixingTwoArrays rs1 rs2 = removeDuplicates (foldr (\[x1,x2,x3,x4] res -> x1:x2:x3:x4:res) [] [[r1, r2, r1 + r2, r1*r2/(r1 + r2)] | r1 <- rs1, r2 <- rs2])

generateAllAchievableResistance [] = []
generateAllAchievableResistance [r] = [r]
generateAllAchievableResistance xs =
    let
      f ys res =
        let
          zs = removeValuesFromList xs ys
        in removeDuplicates ((calculateAllResistancesByMixingTwoArrays (generateAllAchievableResistance ys) (generateAllAchievableResistance zs)) ++ res)
    in removeDuplicates (foldr f [] (generateSubsetsUpToLength xs (length xs `div` 2)))

contains xs x = foldr (||) False (map (==x) xs)

canMakeScheme rs r = contains (generateAllAchievableResistance rs) r
--}
