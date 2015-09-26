/*
 * Задача 31-1
 * Одеров Роман, 545 гр.
 */

using System;

namespace _31_1
{
    class Program
    {
        public static int find(Predicate<int> func, int[] a, Func<int> err)
        {
            foreach (int i in a)
            {
                if (func(i))
                {
                    return i;
                }
            }
            return err();
        }
        public static int find1000500100(int[] a)
        {
            return find(x => x > 1000, a, () => find(x => x > 500, a, () => find(x => x > 100, a, () => { Console.Write("Not Found! "); return 0; })));
        }

        static void Main(string[] args)
        {
            int[] a1001 = { 1001, 501, 101, 10, 5, 1 };
            int[] a501 = { 499, 501, 101, 10, 5, 1 };
            int[] a101 = { 99, 98, 101, 10, 5, 1 };
            int[] aNotFound = { 1, 2, 3, 10, 5, 1 };
            Console.WriteLine("{0}", find1000500100(a1001));
            Console.WriteLine("{0}", find1000500100(a501));
            Console.WriteLine("{0}", find1000500100(a101));
            Console.WriteLine("{0}",find1000500100(aNotFound));
            Console.ReadLine();
        }
    }
}
