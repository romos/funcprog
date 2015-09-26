using System;
using System.Collections.Generic;

/* Задача 5-1
 * Одеров Роман, 545 гр.
 *
 * Программа написана однажды для занятий по Методам Вычислений.
 * Передалано лишь одно: в существующие методы интегрирования
 * добавлена "функциональная суть", а именно функции-параметры.
 */


namespace FuncIntegral
{
    class Program
    {
        private static double SmMiddleRectan(Func<double,double> func, double a, double b, int m)
        {
            double h = (b - a) / m;
            List<double> z = new List<double>();
            double result = 0;
            for (int i = 0; i <= m; i++)
            {
                z.Add(a + i * h);
            }
            for (int i = 1; i <= m; i++)
            {
                result += func((z[i - 1] + z[i]) / 2);
            }
            return result * h;
        }
        private static double SmTrapezium(Func<double, double> func, double a, double b, int m)
        {
            double h = (b - a) / m;
            List<double> z = new List<double>();
            double result1 = 0, result2 = 0;
            for (int i = 0; i <= m; i++)
            {
                z.Add(a + i * h);
            }
            //1
            for (int i = 1; i <= m; i++)
            {
                result1 += (func(z[i]) + func(z[i - 1]));
            }
            //2
            for (int i = 1; i <= m - 1; i++)
            {
                result2 += func(z[i]);
            }
            //return result1 * h / 2; //way 1
            return h * result2 + (func(a) + func(b)) * h / 2; // way 2
        }
        private static double SmSimpson(Func<double, double> func, double a, double b, int m)
        {
            double h = (b - a) / m;
            List<double> z = new List<double>();
            double result = 0;
            for (int i = 0; i <= m; i++)
            {
                z.Add(a + i * h);
            }
            for (int i = 1; i <= m; i++)
            {
                result += (func(z[i - 1]) + 4 * func((z[i - 1] + z[i]) / 2) + func(z[i]));
            }
            return result * h / 6;
        }

        private static double Cube(double i)
        {
            return i * i * i;
        }

        static void Main(string[] args)
        {
            double a, b;
            int m;
            a = 0; b = 1; m = 100;
            string sa,sb,sm;

            Func<double, double> f1 = i => i * i;
            Func<double, double> f2 = i => Math.Sin(i);
            Func<double, double> f3 = i => 1;

            while (true)
            {
                Console.WriteLine("Для выхода нажмите ENTER в любом из пунктов далее:");
                Console.WriteLine();
                
                Console.Write("Введите левую границу промежутка интегрирования:\t");
                sa = Console.ReadLine();
                if (sa == ""){ break; }
                a = Convert.ToDouble(sa);

                Console.Write("Введите правую границу промежутка интегрирования:\t");
                sb = Console.ReadLine();
                if (sb == "") { break; }
                b = Convert.ToDouble(sb);
                
                Console.Write("На сколько частей разбить отрезок интегрирования:\t");
                sm = Console.ReadLine();
                if (sm == "") { break; }
                m = Convert.ToInt32(sm);
                
                Console.WriteLine();
                Console.WriteLine("integral( x * x , {0}, {1},{2})", a, b, m);
                Console.WriteLine("Метод прямоугольников:\t" + SmMiddleRectan(f1, a, b, m));
                Console.WriteLine("Метод трапеций:\t\t" + SmTrapezium(f1, a, b, m));
                Console.WriteLine("Метод Симпсона:\t\t" + SmSimpson(f1, a, b, m));
                Console.WriteLine();
                Console.WriteLine("integral( x * x * x , {0}, {1},{2})", a, b, m);
                Console.WriteLine("Метод прямоугольников:\t" + SmMiddleRectan(Cube, a, b, m));
                Console.WriteLine("Метод трапеций:\t\t" + SmTrapezium(Cube, a, b, m));
                Console.WriteLine("Метод Симпсона:\t\t" + SmSimpson(Cube, a, b, m));
                Console.WriteLine();
                Console.WriteLine("integral( sin(x) , {0}, {1},{2})", a, b, m);
                Console.WriteLine("Метод прямоугольников:\t" + SmMiddleRectan(f2, a, b, m));
                Console.WriteLine("Метод трапеций:\t\t" + SmTrapezium(f2, a, b, m));
                Console.WriteLine("Метод Симпсона:\t\t" + SmSimpson(f2, a, b, m));
                Console.WriteLine();
                Console.WriteLine("integral( 1 , {0}, {1},{2})", a, b, m);
                Console.WriteLine("Метод прямоугольников:\t" + SmMiddleRectan(f3, a, b, m));
                Console.WriteLine("Метод трапеций:\t\t" + SmTrapezium(f3, a, b, m));
                Console.WriteLine("Метод Симпсона:\t\t" + SmSimpson(f3, a, b, m));
                Console.WriteLine();


                Console.WriteLine("==============");
                Console.WriteLine();
            }
            Console.WriteLine("\n\nЗавершение работы...\n");
            System.Threading.Thread.Sleep(1000);
        }
    }
}
