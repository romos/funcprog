{--
Задача 21-4
Одеров Роман, 545 гр.
--}

import Data.Set

data Set used

allLists' n k used = [(x:xs)| x<-[1..n], not (member x used), xs <- if (k>1) then allLists' n (k-1) (insert x used) else [[]] ]

allDiffLists n k = allLists' n k empty
