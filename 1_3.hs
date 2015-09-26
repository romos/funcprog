{--
Задача 1-3
Одеров Роман, 545 гр.
--}

sumsin n = sumsin' n 0 0
sumsin' 0 summ sines = sin(summ) / sines
sumsin' a summ sines = sumsin' (a-1) (summ + a) (sines + sin(a))

{- sumsin' - вспомогательная функция
	a - счетчик от n до 1 для контроля количества слагаемых;
	summ - аккумулятор суммы в числителе, от которой в итоге будет взят синус;
	sines - аккумулятор синусов в знаменателе;
-}
