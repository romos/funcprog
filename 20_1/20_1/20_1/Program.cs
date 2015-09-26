/*
 * Задача 20-1
 * Одеров Роман, 545 гр.
 */
using System;
using System.Collections.Generic;
using System.Linq;

namespace _20_1
{
    class Program
    {
        /* For example:
         * 1/7 = 0,142857142857...
         * 10/7 = 1,42857... <=> (1*10 - 7*0*10) / 7 = 1,42857...
         * 100/7 = 14,2857... <=> (10*10 - 7*1*10) / 7 = 4,2857...
         * ...
         */
        public static IEnumerable<int> digits(int n)
        {
            int nom = 1;
            int denom = n;
            int digit = 0;

            for (int i = 1; ; i++)
            {
                nom = nom * 10 - denom * digit * 10;
                digit = nom / denom;
                yield return digit;
            }
        }
        public static void ShowFractionDigits(int fraction_denom, int count)
        {
            int[] fractDigits = digits(fraction_denom).Take(count).ToArray();
            for (int i = 0; i < count; i++)
            {
                Console.Write("{0}, ", fractDigits[i]);
            }
        }
        static void Main(string[] args)
        {
            string s_fd,s_c = "0";

            Console.Write("\nEnter fraction_denominator(exit = hit ENTER): ");
            s_fd = Console.ReadLine();
            Console.Write("\nEnter count of digits(exit = hit ENTER): ");
            s_c = Console.ReadLine();

            while (s_fd != "" || s_fd != "")
            {
                int count = Convert.ToInt32(s_c);
                int fractDenom = Convert.ToInt32(s_fd);
                ShowFractionDigits(fractDenom, count);

                Console.Write("\nEnter fraction_denominator(exit = hit ENTER): ");
                s_fd = Console.ReadLine();
                Console.Write("\nEnter count of digits(exit = hit ENTER): ");
                s_c = Console.ReadLine();
            }

            Console.WriteLine("\n\n---------\nHappy end. Now hit ENTER");
            Console.ReadLine();
        }
    }
}
