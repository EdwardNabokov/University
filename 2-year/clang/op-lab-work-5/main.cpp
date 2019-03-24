#include <iostream>
#include <cmath>
#include "TSinS.h"
#include "TCosS.h"
#include "TDerivateSinS.h"
#include "TDerivateCosS.h"
using namespace std;
void header();
void menu();
void checkChoice(int &, int min, int max);
int main()
{
	system("color F0");
	TFunct *a, *b, *c, *d;
	header();
	int choice;
	double x;
	do {
		menu();
		checkChoice(choice, 1, 6);
		switch (choice)
		{
		case 1: 
		{ TSinS sines(1.57); a = &sines; cout << "sin(1.57) = " << a->calculate() << endl; break;}
		case 2:
		{TCosS cosines(3.14); b = &cosines; cout << "cos(3.14) = " << b->calculate() << endl; break;}
		case 3: {TDerivateSinS derSin(0); c = &derSin; cout << "sin'(0) = " << c->calculate() << endl; break;}
		case 4: {TDerivateCosS derCos(5); c = &derCos; cout << "cos'(5) = " << c->calculate() << endl; break;}
		case 5: 
		{
			cout << "[1] -> Sin()\n[2] -> Cos()\n[3] -> Sin'()\n[4] -> Cos'()\n";
			checkChoice(choice, 1, 4);
			cout << "Enter x: "; cin >> x;
			switch (choice)
			{
			case 1: { TSinS sines1(x); a = &sines1; cout << "sin(" << x << ") = " << a->calculate() << "\n"; break;}
			case 2: {TCosS cosines1(x); b = &cosines1; cout << "cos(" << x << ") = " << b->calculate() << "\n"; break;}
			case 3: {TDerivateSinS derSin1(x); c = &derSin1; cout << "sin'(" << x << ") = " << c->calculate() << "\n"; break;}
			case 4: {TDerivateCosS derCos1(x); d = &derCos1; cout << "cos'(" << x << ") = " << d->calculate() << "\n"; break;}
			}
			break;
		} 
		case 6: exit(0);
		}
		system("pause");
	} while (true);

}
void header()
{
	cout << "Eduard Nabokov\nIP-52\n\"Polymorphizm\"" << endl;
}
void menu()
{
	cout << "[1] -> Test 1 (Function: sin(x); x = 1.57)\n[2] -> Test 2 (Function cos(x); x = 3.14)\n[3] -> Test 3 (Function sin'(x); x = 0)\n[4] -> Test 4 (Function cos'(x); x = 5)\n[5] -> Customer\n[6] -> Exit\n";
}
void checkChoice(int &ch, int min, int max)
{
	bool flag = 1;
	do
	{
		if (!flag)
		{
			cout << "\nTry again!\n";
		}
		cout << "Enter choice (1 - " << max << "): ";
		cin >> ch;
		flag = 0;
	} while (ch > max || ch < min);
}