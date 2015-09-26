{--
    Task 1
    *Доп. задача, до 11.11*

    Описать бесконечный список lst239, содержащий все целые положительные числа, состоящие только из цифр 2, 3 и 9. (Числа должны идти в порядке возрастания).

    Пример вызова:

    take 15 lst239

    Должно получиться:
    [2,3,9,22,23,29,32,33,39,92,93,99,222,223,229]

    Замечание:
    - Эта задача, на самом деле, довольно эффектно решается с помощью tying the knot. Но, если не придумаете как тут завязать этот узел, эту задачу можно решить любым способом.
--}
lst239knot = [2, 3, 9] : (map (\xs -> foldr (++) [] (map (\x -> [10*x + 2,10*x + 3,10*x + 9]) xs)) lst239knot)
lst239 = foldr (++) [] lst239knot

{--
    Task 2
    *Доп. задача, до 11.11*

    Пусть у нас есть система равенств вида:
    <переменная1> = <переменная2>.
    Мы представляем ее в Хаскеле, как список пар строк. Например, список [("x","y"),("y","z"), ("n","m")] описывает систему равенств:
    x = y
    y = z
    n = m
    Кроме этого пусть у нас есть список переменных. Мы хотим сосчитать, сколько в этом списке различных переменных, с учетом этих равенств. Опишите функцию countDifferentVars, которая для данного списка равенств и списка переменных возвращает число различных переменных.

    Пример вызова:
    countDifferentVars [("x","y"),("y","z"), ("n","m")] ["x","w","y","z","x","n","m"]

    Результат должен быть равен 3, потому что в списке три различных переменных (x - она же у и z, n - она же m, и w).

    Замечания:
    - Это не упражнение на какую-то тему, которую мы проходили - тут надо просто написать более-менее нетривиальный алгоритм на Хаскеле.
--}
addUsedVars vars [] usedVars = vars ++ usedVars
addUsedVars [] _ usedVars = usedVars
addUsedVars (var:vars) pairs usedVars =
    let
      f (x, y) res =
        if x == var && not(elem y vars) && not(elem y res) && not(elem y usedVars)
        then y:res
        else if y == var && not(elem x vars) && not(elem x res) && not(elem x usedVars)
             then x:res
             else res
      newVars = foldr f [] pairs
    in addUsedVars (newVars ++ vars) pairs (var:usedVars)

difVars [] pairs usedVars differentVars = length differentVars
difVars (var:vars) pairs usedVars differentVars =
    if elem var usedVars
    then difVars vars pairs usedVars differentVars
    else difVars vars pairs (addUsedVars [var] pairs usedVars) (var:differentVars)

countDifferentVars pairs vars = difVars vars pairs [] []
