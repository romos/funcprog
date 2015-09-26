/*
*Доп.задача на С++, до 22.10*

Аналогом map в C++ является, видимо, функция transform, а аналогом filter - функция remove_if и remove_copy_if. См. простые примеры вызова этих функций тут:
http://msimuni.wikidot.com/fp-select-where 

С помощью transform и remove_if (или remove_copy_if) опишите код,функцию nonZeroLastDigits, которая:
- берет в качестве параметров массив целых положительных чисел и количество чисел
- печатает последние цифр всех чисел из этого массива, кроме тех чисел, которые оканчиваются на 0.

Например, если входной массив содержал числа 354, 20, 9, 31, то функция должна напечатать 4, 9, 1 .

Замечание:
- Честно говоря, transform и remove_if - это не самое удобная часть С++ ((. И, честно говоря, я лично ими никогда не пользовался и особо не собираюсь. И, конечно, поставленную задачу проще решить без всяких функций. 
- Т.е. это просто упражнение на использование стандартных функций С++, м.б. даже и не очень полезное, признаю((
*/

#include <iostream>
#include <algorithm>

using namespace std;

void nonZeroLastDigits(const int array[], size_t const arrayLength) {
	int temp[arrayLength];
	transform(array, array + arrayLength, temp, [] (int i) { return i % 10; });
	int *end = remove_if(temp, temp + arrayLength, [] (int i) { return i == 0; });
	int *iter = temp;
	while (iter != end) {
		cout << *iter << " ";
		iter++;
	}
}

int main () {
	const int array[] = {354, 20, 9, 31};
	int const arrayLength = sizeof array / sizeof array[0];
	
	nonZeroLastDigits(array, arrayLength);
	
	return 0;
}