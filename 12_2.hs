{--
Задача 12-2
Одеров Роман, 545 гр.
--}

data Scheme t = Resistance t |
				Parallel (Scheme t) (Scheme t) |
				Sequential (Scheme t) (Scheme t)

totalResistance (Resistance t) = t
totalResistance (Sequential r1 r2) = totalResistance r1 + totalResistance r2
totalResistance (Parallel r1 r2) = (totalResistance r1) * (totalResistance r2) / (totalResistance r1 + totalResistance r2)
