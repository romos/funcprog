using System;
using System.Linq;
using System.Collections.Generic;

namespace task_29_2
{
	class Task
	{
		public static int find(Predicate<int> f, int[] a, Func<int> err) 
		{
			foreach (int x in a)
			{
				if (f(x))
				{
					return x;
				}
			}
			return err();
		}
		
		public static int find1(int[] a)
		{
			return find(x => x < 10, a, () => find(x => x < 20, a, () => 20));
		}

		static void Main(string[] args)
		{
			int [] a = { 21, 21, 21, 1};
			int [] b = { 31, 21, 21, 11};
			int [] c = { 21, 21, 21, 21};
			
			Console.WriteLine("{0}", find1(a));
			Console.WriteLine("{0}", find1(b));
			Console.WriteLine("{0}", find1(c));
		}
	}
}