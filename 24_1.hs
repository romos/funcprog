{--
Задача 24-1
Одеров Роман, 545 гр.
--}

data Rect = Rect Double Double Double Double
data Circle = Circle Double Double Double

class Shape a where
	area::a->Double
	perim::a->Double
	contains::a->Double->Double->Bool

instance Shape Rect where
	area (Rect l h cx cy) = l*h
	perim (Rect l h cx cy) = 2*(l+h)
	contains (Rect l h cx cy) x y = let
										l2 = l/2
										h2 = h/2
									in
										(cx - l2 <= x) && (x <= cx + l2) && (cy - h2 <= y) && (y <= cy + h2)

instance Shape Circle where
	area (Circle r cx cy) = 3.14*r*r
	perim (Circle r cx cy) = 2*3.14*r
	contains (Circle r cx cy) x y = ((x-cx)^2+(y-cy)^2 <= r^2)