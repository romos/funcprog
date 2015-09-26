data LogExpr = X | T | F | And LogExpr LogExpr | Or LogExpr LogExpr | Not LogExpr

simplify (And c1 c2) =
    let
      (sc1, flag1) = simplify c1
      (sc2, flag2) = simplify c2
    in if sc1 == F || sc2 == F
       then (F, True)
       else if sc1 == T
            then (sc2, True)
            else if sc2 == T
                 then (sc1, True)
                 else if sc1 == Not sc2 || Not sc1 == sc2
                      then (F, True)
                      else if sc1 == sc2
                           then (sc1, True)
                           else (And sc1 sc2, flag1 || flag2)
simplify (Or d1 d2) =
    let
      (sd1, flag1) = simplify d1
      (sd2, flag2) = simplify d2
    in if sd1 == T || sd2 == T
       then (T, True)
       else if sd1 == F
            then (sd2, True)
            else if sd2 == F
                 then (sd1, True)
                 else if sd1 == Not sd2 || Not sd1 == sd2
                      then (T, True)
                      else if sd1 == sd2
                           then (sd1, True)
                           else (Or sd1 sd2, flag1 || flag2)
simplify (Not (Not le)) = (le, True)
simplify (Not (And le1 le2)) = (Or (Not le1) (Not le2), True)
simplify (Not (Or le1 le2)) = (And (Not le1) (Not le2), True)
simplify (Not T) = (F, True)
simplify (Not F) = (T, True)
simplify e = (e, False)

instance Eq LogExpr where
    X == X = True
    T == T = True
    F == F = True
    (Not le1) == (Not le2) = le1 == le2
    (And le1 le2) == (And le3 le4) = le1 == le3 && le2 == le4
    (Or le1 le2) == (Or le3 le4) = le1 == le3 && le2 == le4
    le1 == le2 = 
        let
          (sle1, flag1) = simplify le1
          (sle2, flag2) = simplify le2
        in if not (flag1 || flag2) then False else sle1 == sle2
