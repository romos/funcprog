{--
Задача 33-1
Одеров Роман, 545 гр.
--}

data LogExpr = 	And LogExpr LogExpr |
				Or LogExpr LogExpr |
				Not LogExpr |
				T | F |
				X

eval (And e1 e2) x = (eval e1 x) && (eval e2 x)
eval (Or e1 e2) x = (eval e1 x) || (eval e2 x)
eval (Not e1) x = not (eval e1 x)
eval T x = True
eval F x = False
eval X x = x

{- 	Проверяем равенство обеих частей, как функций.
	Т.е. на каждом значении из области определения.
-}
instance Eq LogExpr where
	e1 == e2 = (eval e1 True == eval e2 True) && (eval e1 False == eval e2 False)


{-
Надо упрощать выражение, пока оно не перестанет упрощаться.
Т.е. нужно хранить результат упрощения и соответствующий флаг.
Т.о. пусть eval возвращает пару (значение,флаг).
-}
--eval () = (,)
--eval () = (,)
--eval () = (,)
--eval (Not Or) = (,)
--eval (Not (Not e)) = (e, True)
--eval (Not T) = (F, True)
--eval (Not F) = (T, True)
--eval (Not X) = (Not X, False)
--eval T = (T, False)
--eval F = (F, False)
--eval X = (X, False)

