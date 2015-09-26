/*
 * Задача 11-1
 * Одеров Роман, 545 гр.
 */

using System;

namespace _11_1
{
    class Program
    {
        static Func<int,bool> CheckDigitCurried(int i)
        {
            return n => Convert.ToString(i).Contains(Convert.ToString(n));
        }


        static void Main(string[] args)
        {
            int where = 1234567890; // число, в котором искать подпоследовательность
            string what = Console.ReadLine();  // считываем с клавиатуры число, которое ищем
            int what_int = 0;
            
            while (what != "")
            {
                what_int = Convert.ToInt32(what);
                Console.WriteLine(CheckDigitCurried(where)(what_int));
                what = Console.ReadLine();
            }
        }
    }
}
