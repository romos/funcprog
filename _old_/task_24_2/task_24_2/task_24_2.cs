using System;
using System.Linq;
using System.Collections.Generic;

namespace task_24_2
{
	class Task
	{
		public static IEnumerable<int> Merge(IEnumerable<int> a, IEnumerable<int> b)
		{
			IEnumerator<int> aEnum = a.GetEnumerator();
			IEnumerator<int> bEnum = b.GetEnumerator();
			bool aHasNext = aEnum.MoveNext();
			bool bHasNext = bEnum.MoveNext();
			
			while (true)
			{
				if (aHasNext && !bHasNext)
				{
					yield return aEnum.Current;
					while (aEnum.MoveNext())
					{
						yield return aEnum.Current;
					}
					yield break;
				} else if (!aHasNext && bHasNext)
				{
					yield return bEnum.Current;
					while (bEnum.MoveNext())
					{
						yield return bEnum.Current;
					}
					yield break;
				} else if (aHasNext && bHasNext)
				{
					int x = aEnum.Current;
					int y = bEnum.Current;
					if (x == y) 
					{
						aHasNext = aEnum.MoveNext();
						bHasNext = bEnum.MoveNext();
						yield return x;
					} else if (x > y)
					{
						bHasNext = bEnum.MoveNext();
						yield return y;
					} else
					{
						aHasNext = aEnum.MoveNext();
						yield return x;
					}
				} else
				{
					yield break;
				}
			}
		}

		static void Main(string[] args)
		{
			int [] a = { 1, 5, 8, 20};
			int [] b = { 3, 5, 9, 10, 20, 30, 40};
			foreach (int i in Merge(a, b))
			{
				Console.WriteLine(i);
			}
		}
	}
}