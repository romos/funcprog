/*
*Доп.задача на C# до 5.11*

"Задача Кантора" на С#

Опишите на C# блок итератора, возвращающий последовательность всех пар целых положительных чисел.

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
		public static IEnumerable<KeyValuePair<int, int>> Kantor()
		{
			for (int i = 0; ; i++)
			{
				int root = (int) Math.Sqrt(i);
				int sqr = root * root;
				int offset = i - sqr;
				if (offset >= root + 1)
				{
					yield return new KeyValuePair<int, int>(2*root + 1 - offset, root + 1);
				} else
				{
					yield return new KeyValuePair<int, int>(root + 1, offset + 1);
				}
			}
		}

		static void Main(string[] args)
		{
			for (int i = 0; i < 100; i++)
			{
				Console.Write("{0} ", Kantor().ElementAt(i));
			}
		}
	}
}
