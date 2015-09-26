using System;
using System.Linq;
using System.Collections.Generic;

namespace task_29_1
{
	class Task
	{
		private static void AllDiffLists1(int n, int k, Func<int, bool> isInSet, Action print)
		{
			if (k == 0)
			{
				print();
				Console.WriteLine();
				return;
			}
			
			for (int i = 1; i < (n + 1); i++)
			{
				if (!isInSet(i))
				{
					AllDiffLists1(n, k - 1, x => isInSet(x) || x == i, () => { print(); Console.Write("{0} ", i); });
				}
			}
		}
		
		public static void AllDiffLists(int n, int k) 
		{
			AllDiffLists1(n, k, x => false, () => {});
		}

		static void Main(string[] args)
		{
			AllDiffLists(3, 2);
		}
	}
}