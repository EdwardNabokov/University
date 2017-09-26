// OOP9.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <windows.h>
#include <iostream>
#include "../Library/Interface.h"
using namespace std;
int main()
{
	system("color F0");
	setlocale(LC_ALL,"rus");
	typedef Interface*(*classDll)();
	typedef double(*funcDll)(double, double); 
	 
	HINSTANCE hDllInstance = LoadLibrary(L"Library.dll"); 

	classDll func = (classDll) GetProcAddress(hDllInstance, "myFunc");

	Interface* test_ptr = func();
	
	

		if (test_ptr != NULL) {
			cout << "Matrix before:" << endl;
			test_ptr->print();
			try {
				test_ptr->Change();
			}
			catch (...) {
				cout << "Ho-HO" << endl;
			}
			cout << "Matrix after:" << endl;
			test_ptr->print();

			delete test_ptr;
		}
	
	FreeLibrary(hDllInstance); 
	system("pause");
    return 0;
}

