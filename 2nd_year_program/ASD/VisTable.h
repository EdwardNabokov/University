#pragma once
#include <iostream>
#include <iomanip>
#include "Tables.h"

using namespace std;

extern int n;//Количество строк в таблице
extern student table[];

//Вивести таблицю---------------------------------------------------------------------------
void Output()
{
	system("cls");
	printf("-----------TABLE-----------\n");
	printf("Key---Surname---Initial---Birtday-\n");
	for (unsigned short i = 1; i <= n; i++)
	{
		cout << setw(4) << setiosflags(ios::left) << i << " ";
		cout << setw(10) << setiosflags(ios::left) << table[i - 1].surname << "\t " << table[i - 1].index << " ";
		cout <<"\t" << setw(3) << setiosflags(ios::left) << table[i - 1].birthday.day << " " << setw(2) << table[i - 1].birthday.month << " " << setw(10) << table[i - 1].birthday.year << endl;
	}
	printf("---------------------------\n");
}
