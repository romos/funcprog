/*
 * Задача 28-1
 * Одеров Роман, 545 гр.
 */
using System;

namespace _28_1
{
    class Program
    {
        private static void AllLists(int n, int k, Func<int, bool> Used, Action Write)
        {
            if (k >= 1)
            {
                for (int x = 1; x <= n; x++)
                {
                    if (!Used(x))
                    {
                        AllLists(n, k - 1, t => Used(t) || t == x, () => { Write(); Console.Write("{0} ", x); });
                    }
                }
            }
            else
            {
                Write();
                Console.WriteLine();
            }
        }
        public static void AllDiffLists(int n, int k)
        {
            AllLists(n, k, x => false, () => { });
        }

        static void Main(string[] args)
        {
            string s_n, s_k;

            while (true)
            {
                Console.Write("\nEnter n (exit = hit ENTER): ");
                s_n = Console.ReadLine();
                if (s_n == "") { break; }

                Console.Write("\nEnter k (exit = hit ENTER): ");
                s_k = Console.ReadLine();
                if (s_k == "") { break; }

                int n = Convert.ToInt32(s_n);
                int k = Convert.ToInt32(s_k);

                AllDiffLists(n, k);
            }

            Console.WriteLine("\n\n---------\nHappy end. Now hit ENTER");
            Console.ReadLine();
        }
    }
}
