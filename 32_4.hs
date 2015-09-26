{--
Задача 32-4
Одеров Роман, 545 гр.
--}

data Expr = Var String |
			Num Integer |
			Add Expr Expr |
			Mult Expr Expr
			deriving (Show, Eq)

get v [] = 0
get v ((var, val):variables) = if v == var
							  then val
							  else get v variables

eval (Mult e1 e2) variables = (eval e1 variables) * (eval e2 variables)
eval (Add e1 e2) variables = (eval e1 variables) + (eval e2 variables)
eval (Num i) variables = i
eval (Var v) variables = get v variables

--diff X = Num 1
--diff (Num i) = Num 0
--diff (Add e1 e2) = Add (diff e1) (diff e2)
--diff (Mult e1 e2) = Add (Mult (diff e1) (e2)) (Mult (e1) (diff e2))
