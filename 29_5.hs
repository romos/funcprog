{--
Задача 29-5
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