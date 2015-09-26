/*
 * Задача 34-1
 * Одеров Роман, 545 гр.
 */
using System;

namespace _34_1
{
    class Program
    {
        public static int fact_cps(int n, Func<int,int> f)
        {
            if (n == 0)
            {
                return f(1);
            }
            else
            {
                return fact_cps((n-1),t=>f(t*n));
            }
        }

        static void Main(string[] args)
        {
            Console.WriteLine(fact_cps(5,x=>x+3));
            Console.ReadLine(); 
        }
    }
}
