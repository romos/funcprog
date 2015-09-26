using System;
using System.Linq;
using System.Collections.Generic;

namespace task_21_1
{
	class Task
	{
		public static IEnumerable<int> Lst239()
		{
			yield return 2;
			yield return 3;
			yield return 9;
			foreach (int i in Lst239())
			{
				yield return 10*i + 2;
				yield return 10*i + 3;
				yield return 10*i + 9;
			}
		}

		static void Main(string[] args)
		{
			int count = 0;
			foreach (int i in Lst239())
			{
				Console.Write("{0} ", i);
				count++;
				if (count > 15)
				{
					break;
				}
			}
		}
	}
}
