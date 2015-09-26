/*
 * Задача 23-1
 * Одеров Роман, 545 гр.
 */
using System;
using System.Collections.Generic;
using System.Linq;

namespace _23_1
{
    class Program
    {
        public static IEnumerable<int> Lst137()
        {
            yield return 1;
            yield return 3;
            yield return 7;
            foreach (int i in Lst137())
            {
                yield return 10 * i + 1;
                yield return 10 * i + 3;
                yield return 10 * i + 7;
            }
        }

        static public void ShowLst137(int count)
        {
            int[] numbers = Lst137().Take(count).ToArray();
            for (int i = 0; i < count; i++)
            {
                Console.Write("{0}, ", numbers[i]);
            }
        }

        static void Main(string[] args)
        {
            string s_c = "0";

            Console.Write("\nEnter count of digits(exit = hit ENTER): ");
            s_c = Console.ReadLine();

            while (s_c != "")
            {
                int count = Convert.ToInt32(s_c);
                ShowLst137(count);

                Console.Write("\n\nEnter count of digits(exit = hit ENTER): ");
                s_c = Console.ReadLine();
            }

            Console.WriteLine("\n\n---------\nHappy end. Now hit ENTER");
            Console.ReadLine();
        }
    }
}
