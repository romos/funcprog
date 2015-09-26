using System;

namespace task_26_1
{
	abstract class Node
	{
		abstract public string Print();
	}
	
	class Variable : Node
	{
		override public string Print()
		{
			return "X";
		}
	}
	
	class Number : Node
	{
		private int val;
		
		public Number(int n)
		{
			this.val = n;
		}
		
		override public string Print()
		{
			return "N " + val;
		}
	}
	
	class BinOp : Node
	{
		public Node left;
		public Node right;
		private string op;
		
		public BinOp(Node l, Node r, string operation)
		{
			this.left = l;
			this.right = r;
			this.op = operation;
		}
		
		override public string Print()
		{
			return op + " (" + left.Print() + ") (" + right.Print() + ")";
		}
	}
	
	class Add : BinOp
	{
		public Add(Node l, Node r) : base(l, r, "Add") {}
	}
	
	class Mult : BinOp
	{
		public Mult(Node l, Node r) : base(l, r, "Mult") {}
	}
	
	class Task
	{
		public static Node Diff(Node n)
		{
			if (n is Number)
			{
				return new Number(0);
			} else if (n is Variable)
			{
				return new Number(1);
			} else if (n is Add)
			{
				Add m = (Add) n;
				return new Add(Diff(m.left), Diff(m.right));
			} else
			{
				Mult m = (Mult) n;
				return new Add(new Mult(Diff(m.left), m.right), new Mult(m.left, Diff(m.right)));
			}
		}
		
		public static void Main (string[] args)
		{
			Node v = new Variable();
			Node n = new Number(5);
			Node x = new Mult(new Variable(), new Variable());
			
			Console.WriteLine(Diff(v).Print());
			Console.WriteLine(Diff(n).Print());
			Console.WriteLine(Diff(x).Print());
		}
	}
}