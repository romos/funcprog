{-
Задача 36-1
Одеров Роман, 545 гр.
--}

toInt nChurch = nChurch (\t->t+1) 0

inc nChurch = \f x -> f(nChurch f x)



d nCh z = let
			h = inc z
		  in
			if h (+1) 0 == nCh (+1) 0 --нехорошо конкретные значения давать...
			then z
			else d nCh h

dec nChurch = d nChurch (\f x -> x)



{- CopyPaste from the Internet (1):

dec n = d zer where
         zer s z = z
         v = n          -- global constants
         d m = let h = inc m
               in if h == v then m else d (inc m)
-}
{- CopyPaste from the Internet (2):

dec nChurch = 	let
					zero s z = z
				in
					fst (nChurch (\(_,b)->(b,inc b)) (zero,zero))
-}