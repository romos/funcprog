using System;
using System.Linq;
using System.Collections.Generic;

namespace task_21_2
{
	class Task
	{
		public static IEnumerable<Double> Iterate(double x, Func<double, double> f)
		{
			yield return x;
			foreach (double y in Iterate(x, f))
			{
				yield return f(y);
			}
		}

		static void Main(string[] args)
		{
			foreach (double x in Iterate(2, x => x*2))
			{
				Console.WriteLine(x);
				if (x > 1000000)
				{
					break;
				}
			}
		}
	}
}