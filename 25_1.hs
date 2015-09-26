{--
Задача 25-1
Одеров Роман, 545 гр.
--}

allLists' n k used = [(x:xs)| 	x<-[1..n],
								not (used x),
								xs <- 	if (k>1)
										then allLists' n (k-1) (\t -> used t || t == x)
										else [[]]
					]
allDiffLists n k = allLists' n k (const False)
