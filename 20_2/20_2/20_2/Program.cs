/*
 * Задача 20-2
 * Одеров Роман, 545 гр.
 */
using System;
using System.Collections.Generic;
using System.Linq;

namespace _20_2
{
    class Program
    {
        public static IEnumerable<int[]> cantor()
        {
            for (int d = 1; ; d++)
            {
                for (int n = d; n > 0; n--)
                {
                    yield return new int[2] { n, d - n + 1 };
                }
            }
        }
        public static void ShowCantor(int n)
        {
            int[][] cantorPairs = cantor().Take(n).ToArray();
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine("( {0},{1} )",cantorPairs[i][0],cantorPairs[i][1]);
            }
        }
        static void Main(string[] args)
        {
            string s = "0";
            
            Console.Write("\nEnter number of Cantor pairs (exit = hit ENTER): ");
            s = Console.ReadLine();
            
            while (s != "")
            {
                int count = Convert.ToInt32(s);
                ShowCantor(count);

                Console.Write("\nEnter number of Cantor pairs (exit = hit ENTER): ");
                s = Console.ReadLine();
            }
            
            Console.WriteLine("\n\n---------\nHappy end. Now hit ENTER");
            Console.ReadLine();
        }
    }
}
