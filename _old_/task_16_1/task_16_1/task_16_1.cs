/*
*Доп.задача до 30.10*

Используя функцию Select из задачи 13-1, напишите функцию zeroDigits с двумя параметрами a (массив целых положительных чисел), n (целое положительное число). Эта функция должна во всех элементов массива a заменить последние n цифр на 0 и вернуть полученный новый массив.

Например, если в массиве числа, 563, 5643, 76796,
то после вызова zeroDigits(a, 2) должен вернуться массив из чисел 500, 5600, 76700
*/

using System;
using System.Linq;

namespace task_16_1
{
	class Task
	{
		static int[] zeroDigits(int[] array, int n)
		{
			int tenPower = (int) Math.Pow(10, n);
			return array.Select(x => x / tenPower * tenPower).ToArray();
		}

		static void Main(string[] args)
		{
			int[] a = {563, 5643, 76796};
			int n = 2;
			
			foreach (int x in zeroDigits(a, n))
			{
				Console.Write("{0} ", x);
			}
		}
	}
}
