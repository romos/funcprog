/*
 * Задача 34-2
 * Одеров Роман, 545 гр.
 */
using System;

namespace _34_2
{
    abstract class Node
    {
        abstract public string Print();
    }
    class Variable:Node
    {
        override public string Print()
        {
            return "X";
        }
    }
    class Number:Node
    {
        public int n;
        public Number(int x)
        {
            this.n = x;
        }
        override public string Print()
        {
            return this.n.ToString();
        }
    }
    class Op:Node
    {
        public Node left;
        public Node right;
        public string operat;

        public Op(Node l, Node r, string op)
        {
            this.left = l;
            this.right = r;
            this.operat = op;
        }
        override public string Print()
        {
            switch (operat)
            {
                case "Add":
                    return " (" + left.Print() + " " + "+" + " " + right.Print() + ") ";
                case "Mult":
                    return " (" + left.Print() + " " + "*" + " " + right.Print() + ") ";
            }
            return " (" + left.Print() + " " + operat + " " + right.Print() + ") ";
        }
    }
    //class Add : Op
    //{
    //    public Add(Node l, Node r)
    //        : base(l, r, "Add")
    //    {
    //    }
    //}
    //class Mult : Op
    //{
    //    public Mult(Node l, Node r)
    //        : base(l, r, "Mult")
    //    {
    //    }
    //}

    class Program
    {

        public static Node Diff(Node n)
        {
            if (n is Variable)
            {
                return new Number(1);
            }
            if (n is Number)
            {
                return new Number(0);
            }
            
            if (n is Op)
            {
                Op expr = (Op) n;
                if (expr.operat == "Add")
                {
                    return new Op(Diff(expr.left), Diff(expr.right),"Add");
                }
                if (expr.operat == "Mult")
                {
                    return new Op(new Op(expr.left, Diff(expr.right), "Mult"), new Op(Diff(expr.left), expr.right, "Mult"), "Add");
                }
                else
                    return null;
            }

            
            else return null;
        }

        static void Main(string[] args)
        {
            Variable v = new Variable();
            Number n = new Number(7);
            //Mult m = new Mult(new Variable(), new Variable());
            Op expr = new Op(new Variable(), new Variable(), "Mult");

            Console.WriteLine(Diff(v).Print());
            Console.WriteLine(Diff(n).Print());
            //Console.WriteLine(Diff(m).Print());
            Console.WriteLine(Diff(expr).Print());

            Console.ReadLine();


        }
    }
}
