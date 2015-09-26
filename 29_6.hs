{--
Задача 29-6
Одеров Роман, 545 гр.
--}

data Expr = Num Integer |
			X |
			Add Expr Expr |
			Mult Expr Expr
			deriving (Show, Eq)

eval (Mult e1 e2) x = (eval e1 x) * (eval e2 x)
eval (Add e1 e2) x = (eval e1 x) + (eval e2 x)
eval (Num i) x= i
eval X x = x

diff X = Num 1
diff (Num i) = Num 0
diff (Add e1 e2) = Add (diff e1) (diff e2)
diff (Mult e1 e2) = Add (Mult (diff e1) (e2)) (Mult (e1) (diff e2))
