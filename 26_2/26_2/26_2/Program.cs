/*
 * Задача 26-2
 * Одеров Роман, 545 гр.
 */
using System;
using System.Collections.Generic;

namespace _26_2
{
    class Program
    {
        public static IEnumerable<int> Merge(IEnumerable<int> a, IEnumerable<int> b)
        {
            IEnumerator<int> aEn = a.GetEnumerator();
            IEnumerator<int> bEn = b.GetEnumerator();
            bool aMoveNext = aEn.MoveNext();
            bool bMoveNext = bEn.MoveNext();

            while (true)
            {
                if (aMoveNext && bMoveNext) // в обоих списках еще остались элементы
                {
                    if (aEn.Current < bEn.Current)
                    {
                        yield return aEn.Current;
                        aMoveNext = aEn.MoveNext();
                    }
                    else
                        if (aEn.Current > bEn.Current)
                        {
                            yield return bEn.Current;
                            bMoveNext = bEn.MoveNext();
                        }
                        else
                            if (aEn.Current == bEn.Current)
                            {
                                yield return aEn.Current;
                                aMoveNext = aEn.MoveNext();
                                bMoveNext = bEn.MoveNext();
                            }
                }
                else
                if (aMoveNext && !bMoveNext) // один из списков закончился
                {
                    yield return aEn.Current;
                    while (aEn.MoveNext())
                    {
                        yield return aEn.Current;
                    }
                    yield break;
                }
                else
                if (!aMoveNext && bMoveNext) // другой список закончился
                {
                    yield return bEn.Current;
                    while (bEn.MoveNext())
                    {
                        yield return bEn.Current;
                    }
                    yield break;
                }
                else
                {
                    yield break;
                }
            }
        }

        static void Main(string[] args)
        {
            int[] a = { 1, 5, 8 };
            int[] b = { 3, 5, 9 };
            //int[] a = { 1, 5, 8, 10, 15, 20, 22 };
            //int[] b = { 3, 5, 9, 10, 11, 12 };
            //int[] a = { };
            //int[] b = { };
            foreach (int i in Merge(a, b))
            {
                Console.WriteLine(i); // Должно напечататься 1, 3, 5, 8, 9
            }
            Console.ReadLine();
        }
    }
}
