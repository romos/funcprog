/*
*Доп.задача до 30.10*

Используя функцию transform из задачи 13-2, напишите функцию zeroDigits с тремя параметрами a (массив), size (размер массива), n (целое положительное число). Эта функция должна во всех элементов массива a заменить последние n цифр на 0.

Например, если в массиве числа, 563, 5643, 76796,
то после вызова zeroDigits(a, 3, 2) в массиве должны быть числа 500, 5600, 76700

Замечания:
- Важно: Eсли в С++ в лямбда-выражении используются нелокальные переменные (т.е. используется замыкание), то их надо перечислить в начале лямбда выражения в квадратных скобках (это так называемый список захвата - capture list). Например:

[n] (int i) { return i + n; }

- список захвата можно записать и другими способами, но это остается для самостоятельного изучения :)
*/

#include <iostream>
#include <algorithm>
#include <math.h>

using namespace std;

void zeroDigits(const int array[], size_t const arrayLength, int const n) {
	int res[arrayLength];
	int const tenPower = pow(10, n);
	
	transform(array, array + arrayLength, res, [tenPower] (int i) { return i / tenPower * tenPower; });
	
	for (int i = 0; i < arrayLength; ++i) {
		cout << res[i] << " ";
	}
}

int main () {
	const int array[] = {563, 5643, 76796};
	int const arrayLength = sizeof array / sizeof array[0];
	int const n = 2;
	
	zeroDigits(array, arrayLength, n);
	
	return 0;
}
