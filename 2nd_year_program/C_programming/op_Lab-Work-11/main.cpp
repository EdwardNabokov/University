#include <iostream>
#include "helper.h"
using namespace std;

void main()
{
	system("color F0");
	int value; //value for each node
	Tree *MyTree = NULL; // pointer to struct
	int n; // quantity of stages
	cout << "Inut n: "; cin >> n;
	value = n;
	for (int i = 0; i < n; i++) 
	{
		
		fill(value, &MyTree); 
		value--;
	}
	output(MyTree); 
	system("pause");
}