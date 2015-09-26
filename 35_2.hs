{--
Задача 35-2
Одеров Роман, 545 гр.
--}

downUp n 
	|n > 1 = do
				print n
				downUp (n-1)
				print n
	|n == 1 = print 1
	|otherwise = 
		print "Error! Your N must be >=1"