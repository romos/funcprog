/*
Task 5.2
*Доп. задача*
Очень простая функция высшего порядка на C++

Написать на C++ шаблон функции integral, которая позволяет вычислять определенный интеграл на данном интервале. У нее должны быть быть 3 параметра:
- f - функция или лямбда выражение 
- a, b - пределы интегрирования.
Пример вызова:

double result = integral([](double x) { return x*x; }, 0, 1);

Метод интегрирования можно взять любым, самым простым. Например, разбить отрезок на 100 равных частей и использовать метод прямоугольников или метод трапеций. 

Про то, зачем эти задачки, как их сдавать и т.д. см. http://msimuni.wikidot.com/fp-dop2
*/

#include <stdio.h>

using namespace std;

typedef double (*Fun)(double n);

template<typename Fun> double integral(Fun f, double a, double b)
{
	if (a >= b)	{
		return 0;
	}

	double step = (a + b) / 100;
	double sum = 0;

	for (int i = 0; i < 100; i++) {
		sum += (f(a + (i + 1) * step) + f(a + i * step)) * step / 2 ;
	}
	
	return sum;
}

double f(double x) {
	return x * x;
}

int main(int argc, char *argv[])
{
	printf("%f\n", integral([](double x) { return x * x; }, 0, 1));
	printf("%f\n", integral(f, 0, 1));
	
	return 0;
}
