/*
 * Задача 26-1
 * Одеров Роман, 545 гр.
 */

using System;

namespace _26_1
{
    class Program
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

            int afrom = a[from];
            if (cond(afrom))
            {
                return allDifferent1(a, from + 1, t => cond(t) && (t != afrom));
            }
            else
            {
                return false;
            }
        }
        public static string Show(int[] a)
        {
            string str = "";
            for (int i = 0; i < a.Length - 1; i++)
            {
                str += a[i] + ", ";
            }
            str += a[a.Length - 1];
            return str;
        }

        static void Main(string[] args)
        {
            int[] a = { 1, 2, 3, 4, 5, 6 };
            int[] b = { 1, 2, 3, 4, 5, 1 };
            int[] c = { 1, 2, 2, 3 };
            Console.WriteLine("Does array [ {0} ] consist of unique elements?\n\t{1}\n\n", Show(a), allDifferent(a));
            Console.WriteLine("Does array [ {0} ] consist of unique elements?\n\t{1}\n\n", Show(b), allDifferent(b));
            Console.WriteLine("Does array [ {0} ] consist of unique elements?\n\t{1}\n\n", Show(c), allDifferent(c));
            Console.WriteLine("\n\n---------\nHappy end. Now hit ENTER");
            Console.ReadLine();
        }
    }
}
