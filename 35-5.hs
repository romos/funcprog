--module ThirtyFiveDotFive where

data Expr = Num Integer | Add Expr Expr | Mult Expr Expr | Var String |
            Let String Integer Expr | LetFunc String String Expr Expr | Call String Expr deriving Show

getFuncValue name [] = ("", (Num 0))
getFuncValue name ((funcName, varName, funcExpr):funcs) = if name == funcName 
	                                                      then (varName, funcExpr) 
	                                                      else getFuncValue name funcs

getVarValue name [] = 0
getVarValue name ((varName, varVal):vars) = if name == varName then varVal else getVarValue name vars

eval (Num val) _ _ = val
eval (Add e1 e2) vars funcs = (eval e1 vars funcs) + (eval e2 vars funcs)
eval (Mult e1 e2) vars funcs = (eval e1 vars funcs) * (eval e2 vars funcs)
eval (Var name) vars _ = getVarValue name vars
eval (Let varName varVal e) vars funcs = eval e ((varName, varVal) : vars) funcs
eval (LetFunc funcName varName funcExpr e) vars funcs = eval e vars ((funcName, varName, funcExpr) : funcs)
eval (Call funcName e) vars funcs = let
                                      (varName, funcExpr) = getFuncValue funcName funcs
                                      varVal = eval e vars funcs
                                    in eval funcExpr ((varName, varVal) : vars) funcs