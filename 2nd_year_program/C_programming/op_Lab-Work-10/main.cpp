#include <iostream>
#include "Support.h"
using namespace std;

int main()
{
	Queue List;
	system("color F0");
	createList(&List);
	cout << "[1] -> Add character to the end of queue\n";
	cout << "[2] -> Delete first character from queue\n";
	cout << "[3] -> Find max value and replace to the beginning of queue\n";
	cout << "[4] -> Output content of queue\n";
	cout << "[0] -> Exit\n\n";
	int command;
	do
	{
		//system("cls");
		cout << "Number of command -> ";
		cin >> command;
		switch (command)
		{
		case 1: addElement(&List); break;
		case 2: if (isEmpty(&List)) deleteElement(&List);
				else cout << "\nQueue is empty\n"; break;
		case 3: if(isEmpty(&List)) FindChange(&List); 
				else cout << "\nQueue is empty\n"; break;
		case 4: if(isEmpty(&List)) outputElements(&List); 
				else cout << "\nQueue is empty\n"; break;
		case 0: break;
		default: cout << "\nCommand is not defined!\n";
		}
		//system("pause");
	} while (command != 0);
}