/*
Task 5.1
*Доп. задача*
Очень простая функция высшего порядка на C#

Написать на C# функцию (статический метод) integral, которая позволяет вычислять определенный интеграл на данном интервале. У нее должны быть быть 3 параметра:
- f - функция (статический метод или лямбда выражение) 
- a, b - пределы интегрирования.
Пример вызова:

double result = integral(x => x*x, 0, 1);

Метод интегрирования можно взять любым, самым простым. Например, разбить отрезок на 100 равных частей и использовать метод прямоугольников или метод трапеций.

Про то, зачем эти задачки, как их сдавать и т.д. см. http://msimuni.wikidot.com/fp-dop2
*/

using System;
using System.Linq;

namespace task_5_1
{
	class Task
	{
		static double integral(Func<double, double> f, double a, double b)
		{
			if (a >= b)
			{
				return 0;
			}
			
			double step = (a + b) / 100;
			double sum = 0;
			for (int i = 0; i < 100; i++)
			{
				sum += (f(a + (i + 1) * step) + f(a + i * step)) * step / 2 ;
			}
			
			return sum;
		}

		static Func<double, double> sqr = i => i * i;

		static double cube(double i)
		{
			return i * i * i;
		}

		static void Main(string[] args)
		{
			Console.WriteLine("{0}", integral(sqr, 0, 1));
			Console.WriteLine("{0}", integral(x => x * x, 0, 1));
			Console.WriteLine("{0}", integral(cube, 0, 1));
		}
	}
}
