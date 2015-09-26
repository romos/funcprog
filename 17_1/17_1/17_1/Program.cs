/*
 * Задача 17-1
 * Одеров Роман, 545 гр.
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _17_1
{
    class Program
    {
        static int[] nonZeroLastDigits(int[] a, int n)
        {
            return a.Select(x => x - x % Convert.ToInt32(Math.Pow(10,n))).ToArray();
        }
        static void Main(string[] args)
        {
            int[] a = { 354, 21, 91, 31 };
            int[] b = { 156546, 2565, 355, 466, 577, 180, 191, 220, 215, 1000, 1001, 5443 };
            foreach (int x in nonZeroLastDigits(a,1))
            {
                Console.Write(x + " ");
            }
            Console.WriteLine();
            foreach (int x in nonZeroLastDigits(b,2))
            {
                Console.Write(x + " ");
            }
            Console.ReadLine();
        }
    }
}
