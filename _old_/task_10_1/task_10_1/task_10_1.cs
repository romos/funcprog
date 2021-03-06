/*
*Доп.задача, до 15.10*
Описать на C# тип "двоичное дерево, элементы которого - целые числа". Для этого дерева опишите аналог функции Any, которая обсуждалась в задаче 7.1. У этой функции должен быть параметр "условие" - логическая функция, и она должна проверять, есть ли a дереве элемент, удовлетворяющий условию.

Т.е. решение должно состоять из программы на C#, в которой:
- описан тип "дерево"
- описана функция, аналогичная Any, но для дерева. Это может быть метод класса "дерево", или отдельная статическая функция, как хотите.
- приведен пример вызова, т.е. создано какое-то дерево, хоть самое просто, из двух-трех вершин, и для него вызвана функция Any. 

Справка: Логические функции можно описать как Function. (Или можно описать как Predicate - это одно и то же.)

Замечания:
- Проще всего весь код записать в одном файле, и поместить в систему тестирования. Но, если хотите, вы можете создать несколько файлов (один для дерева, другой для Main) и прислать мне их по почте.
- Эта задача, конечно, немного посложнее предыдущих по C# - те были, скорее, упражнениями. Если что-то будет не получатся, можете писать и задавать вопросы..
*/

using System;

namespace task_10_1
{
	class Node
	{
		public Node(int val) {
			this.Val = val;
		}
		
		public Node(int val, Node left, Node right) {
			this.Val = val;
			this.Right = right;
			this.Left = left;
		}
		
		public bool Any(Func<int, bool> p)
		{
			return p(Val) || Left != null && Left.Any(p) || Right != null && Right.Any(p);
		}
		
		private int Val;
		private Node Left;
		private Node Right;
	}
	
	class Task
	{
		public static void Main (string[] args)
		{
			Node n = new Node(1, new Node(1), new Node(1, new Node(1), null));
			Console.WriteLine("{0}", n.Any(x => x % 2 == 0));
			
			n = new Node(1, new Node(1), new Node(1, new Node(2), null));
			Console.WriteLine("{0}", n.Any(x => x % 2 == 0));
		}
	}
}

