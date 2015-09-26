{--
Задача 24-2
Одеров Роман, 545 гр.
--}
data Ration = Rat Int Int

instance Num Ration where
	(Rat nom1 denom1) + (Rat nom2 denom2) = let
												nom = denom1 * nom2 + denom2 * nom1
												denom = denom1 * denom2
											in
												Rat nom denom

instance Eq Ration where
	(Rat nom1 denom1) == (Rat nom2 denom2) = (nom1*denom2 == nom2*denom1)

instance Ord Ration where
	(Rat nom1 denom1) < (Rat nom2 denom2) = if (denom1*denom2 > 0) then (nom1*denom2 < nom2*denom1) else (nom1*denom2 > nom2*denom1)

instance Show Ration where
		show (Rat nom denom) = show (nom) ++ "/" ++ show (denom)