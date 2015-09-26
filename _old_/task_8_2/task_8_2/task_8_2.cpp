/*
Task 8.2
*Простая задача (скорее упражнение) на C++ (дополнительная, до 8.10 включительно)**

В С++ нет стандартной функции, аналогичной Any. Но есть функция find_if, которая еще более мощная, она возвращает итератор для найденного элемента.

Используя только функцию find_if и лямбда выражение, проверить для данного одномерного массива (или, если хотите, списка, вектора и т.д.)
верно ли, что в нем есть хотя бы один четный элемент?

Замечания: 
- Тут задание состоит просто в том, чтобы найти описание find_if и понять, как его вызывать, вот и все.
- Остальные замечания такие же, как и задаче 8 - 1: 
- решение должна содержать компилируемй код с примером вызова;
- его можно выкладывать в систему, хоть это и не программа на Хаскеле - но тестов там нет, я посмотрю глазами.
*/

#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

bool checkParity(int array[], size_t arrayLength) {
	int *arrayEnd = array + arrayLength;
	int *iterator = find_if(array, arrayEnd, [](int x){ return x % 2 == 0; });
	return iterator != arrayEnd;
}

bool isEven(int x) {
	return x % 2 == 0;
}

bool checkParity(vector<int> v) {
	vector<int>::iterator i;
	i = find_if (v.begin(), v.end(), isEven);
	return i != v.end();
}

int main () {
	int array1[] = {3, 5, 7, 9, 11};
	int array2[] = {3, 5, 8, 9, 11};
	int array1Length = sizeof array1 / sizeof array1[0];
	int array2Length = sizeof array2 / sizeof array2[0];
	
	cout << checkParity(array1, array1Length) << endl;
	cout << checkParity(array2, array2Length) << endl;
	
	vector<int> vector1(array1, array1 + array1Length);
	vector<int> vector2(array2, array2 + array2Length);
	
	cout << checkParity(vector1) << endl;
	cout << checkParity(vector2) << endl;
	
	return 0;
}
