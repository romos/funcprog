{--
Задача 32-5
Одеров Роман, 545 гр.
--}

data Expr = X |
			Num Integer |
			Add Expr Expr |
			Mult Expr Expr
			deriving (Show, Eq)

simplify (Mult e1 e2) = let
							simple1 = simplify e1
							simple2 = simplify e2
						in
							if simple1 == Num 0 || simple2 == Num 0
							then Num 0
							else Mult simple1 simple2
simplify (Add e1 e2) = Add (simplify e1) (simplify e2)
simplify (Num i)= (Num i)
simplify X = X

--eval (Mult e1 e2) x = (eval e1 x) * (eval e2 x)
--eval (Add e1 e2) x = (eval e1 x) + (eval e2 x)
--eval (Num i) x= i
--eval X x = x

--diff X = Num 1
--diff (Num i) = Num 0
--diff (Add e1 e2) = Add (diff e1) (diff e2)
--diff (Mult e1 e2) = Add (Mult (diff e1) (e2)) (Mult (e1) (diff e2))
