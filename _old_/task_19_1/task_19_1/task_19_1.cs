/*
*Доп.задача на C# до 5.11*

Опишите блок итератора digits(int n), возвращающий последовательность цифр дроби 1/n. Например, при обращении к digits(7) должны возвращаться цифры 1, 4, 2, 8, 5, 7, 1, 4, 2, 8, 5, 7, ...

C использованием digits напишите программу, которая вводит число n и печатает первые 100 цифр числа 1/n.

Про блоки итераторов немного написано вот тут:
http://msimuni.wikidot.com/fp-generators
*/

using System;
using System.Linq;
using System.Collections.Generic;

namespace task_19_1
{
	class Task
	{
		public static IEnumerable<int> digits(int n)
		{
			int x = 10;
			for (int i = 0; ; i++)
			{
				if (x < n)
				{
					yield return 0;
				} else
				{
					int res = x / n;
					yield return res;
					x -= res*n;
				}
				x *= 10;
			}
		}

		static void Main(string[] args)
		{
			Console.WriteLine("Enter integer number:");
			int n = int.Parse(Console.ReadLine());
			
			int count = 0;
			foreach (int i in digits(n))
			{
				Console.Write("{0} ", i);
				count++;
				if (count > 100)
				{
					break;
				}
			}
		}
	}
}
