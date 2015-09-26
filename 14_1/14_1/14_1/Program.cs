/*
 * Задача 14-1
 * Одеров Роман, 545 гр.
 */
using System;
using System.Linq;

namespace _14_1
{
    class Program
    {
        static int[] nonZeroLastDigits(int[] a)
        {
            return a.Select(x => x % 10).Where(x => x > 0).ToArray();
        }
        static void Main(string[] args)
        {
            int[] a = { 354, 20, 9, 31 };
            int[] b = { 1, 2, 3, 4, 5, 10, 11, 20, 25, 1000, 1001, 5443 };
            foreach (int x in nonZeroLastDigits(a))
            {
                Console.Write(x+" ");
            }
            Console.WriteLine();
            foreach (int x in nonZeroLastDigits(b))
            {
                Console.Write(x + " ");
            }
            Console.ReadLine();
        }
    }
}
