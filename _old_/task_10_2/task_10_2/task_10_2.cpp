/*
*Доп.задача, до 15.10*
Описать на C++ тип "двоичное дерево, элементы которого - целые числа". Для этого дерева опишите что-то похожее на функцию Any из задачи 7.1. 

В этом случае, видимо, проще всего описать шаблон функции any, примерно так же, как мы описывали шаблон для интеграла. Один из параметров этой функции - условие, которое надо проверить, в другой - корень дерева (или указатель на корень дерева, как будет удобнее).

Т.е. решение должно состоять из программы на C++, в которой:
- описан тип "дерево"
- описана шаблон функции, аналогичной Any из 7.1, но для дерева.
- приведен пример вызова, т.е. создано какое-то дерево, хоть самое просто, из двух-трех вершин, и для него вызван этот шаблон. 

Замечания:
- Замечания те же, что 10.1. Эта задача, конечно, немного посложнее предыдущих по C++. Если что-то не получается или непонятно, можете задавать вопросы..
*/

#include <iostream>

using namespace std;

typedef bool (*Fun)(int n);

class Node
{
public:
	Node(int const value, const Node *left = NULL, const Node *right = NULL)
			: mValue(value)
			, mLeft(left)
			, mRight(right)
	{
	}
		
	bool any(const Fun p) const {
		return p(mValue) || mLeft != NULL && mLeft->any(p) || mRight != NULL && mRight->any(p);
	}
	
	void setValue(int const value) {
		mValue = value;
	}
	
private:
	int mValue;
	const Node *mLeft;
	const Node *mRight;
};

int main () {
	Node *n11 = new Node(1);
	const Node *n12 = new Node(1);
	const Node *n2 = new Node(1, n11, NULL);
	const Node *n3 = new Node(1, NULL, n2);
	const Node *n4 = new Node(1, n12, n3);
	
	cout << n4->any([](int x) { return x % 2 == 0; }) << endl;
	
	n11->setValue(2);
	
	cout << n4->any([](int x) { return x % 2 == 0; });
	
	delete n11;
	delete n12;
	delete n2;
	delete n3;
	delete n4;
	
	return 0;
}
