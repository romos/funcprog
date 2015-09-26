/*
 *Задача 8-1
 *Одеров Роман, 545 гр.
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _8_1
{
    class Program
    {
        private static bool checkEven(int[][] array)
        {
            return array.All(arr => arr.Any(a => (a % 2 == 0)));
        }
        static void Main(string[] args)
        {
            int[][] a1 = { new int[] { 1, 3, 2 },
                           new int[] { 3, 8, 9 } };
            int[][] a2 = { new int[] { 1, 3, 5 },
                           new int[] { 3, 7, 9 } };
            foreach (Array a in a1)
            {
                foreach (int i in a)
                {
                    Console.Write("{0} ", i);
                }
                Console.Write("\n");
            }
            Console.WriteLine("{0}\n", checkEven(a1));
            foreach (Array a in a2)
            {
                foreach (int i in a)
                {
                    Console.Write("{0} ", i);
                }
                Console.Write("\n");
            }
            Console.WriteLine("{0}\n", checkEven(a2));
            Console.ReadLine();
        }
    }
}
