/*
 *Доп.задача на C#, до 22.10*

Аналогом map в C# является, видимо, метод Select, а аналогом filter - метод Where (это части LINQ но их вполне можно использовать и просто как удобные методы). См. простые примеры вызова этих методов тут:
http://msimuni.wikidot.com/fp-select-where 

С помощью Select и Where опишите функцию nonZeroLastDigits, которая:
- берет в качестве параметра массив целых положительных чисел
- возвращает массив из последних цифр всех чисел из исходного массива, кроме тех чисел, которые оканчиваются на 0.

Например, если входной массив содержит числа 354, 20, 9, 31, то надо вернуть массив из чисел 4, 9, 1 .

Замечание:
- Конечно, в этой задаче нет особого смысла, это просто несложное упражнение на вызов Select и Where.
*/

using System;
using System.Linq;

namespace task_13_1
{
	class Task
	{
		static int[] nonZeroLastDigits(int[] array)
		{
			return array.Select(x => x % 10).ToArray().Where(x => x > 0).ToArray();
		}

		static void Main(string[] args)
		{
			int[] a = {354, 20, 9, 31};
			
			foreach (int x in nonZeroLastDigits(a))
			{
				Console.Write("{0} ", x);
			}
		}
	}
}

