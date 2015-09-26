using System;
using System.Linq;
using System.Collections.Generic;

namespace task_24_1
{
	class Task
	{
		public static bool allDifferent(int[] a)
		{
			return allDifferent1(a, 0, t => true);
		}
		
		public static bool allDifferent1(int[] a, int from, Predicate<int> cond)
		{
			if (from == a.Length)
			{
				return true;
			}
			
			int x = a[from];
			if (!cond(x))
			{
				return false;
			} else
			{
				return allDifferent1(a, from + 1, t => cond(t) && t != x);
			}
		}
		
		static void Main(string[] args)
		{
			int[] a = {1,2,3,4,5};
			int[] b = {1,2,3,4,1};
			Console.WriteLine(allDifferent(a));
			Console.WriteLine(allDifferent(b));
		}
	}
}