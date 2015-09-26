{--
Задача 6-1
Одеров Роман, 545 гр.
--}


isosc a b c = (dist a b == dist a c)||(dist a b == dist b c)||(dist a c == dist b c)

dist (x1,y1) (x2,y2) = sqrt((x1-x2)^2+(y1-y2)^2)