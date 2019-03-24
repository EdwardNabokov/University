#pragma once
#include <iostream>
#include <iomanip>
#include <stdio.h>
#include <conio.h>
#include "Tables.h"
#include <ctime>

using namespace std;

extern int n;//Количество строк в таблице
extern student table[];
int search[15];
extern int  c;

int  *selectTable();//Вибір даних в таблиці 
void insertTable();//Вставка даних в таблицю
void deleteTable();//Видалення даних з таблиці
void updateTable();//Зміна даних в таблиці
void Output();//Вивести таблицю
short choiceInput(short &); 


//Вибір даних в таблиці---------------------------------------------------------------------
int *selectTable()
{
	printf("\nChoose data by:\n[1] -> Number\n[2] -> Surname\n[3] -> Initial\nYour choice: ");
	short choice;
	for (int i = 1; i <= n+1; i++)
	{
		search[i - 1] = 0;
	}
	c = 1;
	choiceInput(choice);
	switch (choice)
	{
	case 1:
	{
		cout << "\nEnter Number: ";
		cin >> choice;
		search[choice - 1] = 1;
		break;
	}
	case 2:
	{ cout << "\nEnter Surname: ";
	char sur[15];
	cin >> sur;
	do {

			if (!strcmp(table[c - 1].surname,sur))
			{
				search[c - 1] = 1;
				break;
			}
			else
				c++;

		} while (!(n == c));
	}
	break;
	case 3:
	{
		cout << "\nEnter Initial: ";
		char initial;
		cin >> initial;
		do
		{
			if (table[c - 1].index == initial)
			{
				search[c-1] = 1;
				break;
			}
			else
				c++;
		} while (!(n == c));
	}
	}
	return search;
}

//Вставка даних в таблицю-------------------------------------------------------------------
void insertTable()
{
	n++;
	char surname[10];
	cout << "\tEnter new data";
	cout << endl << "Enter surname: ";
	cin >> surname;
	table[n - 1].surname = surname;
	cout << endl << "Enter initial: ";
	cin >> table[n - 1].index;
	cout << endl << "Enter day: ";
	cin >> table[n - 1].birthday.day;
	cout << endl << "Enter month: ";
	cin >> table[n - 1].birthday.month;
	cout << endl << "Enter year: ";
	cin >> table[n - 1].birthday.year;
	Output();
}
//Видалення даних з таблиці-----------------------------------------------------------------
void deleteTable()
{
	int *p = selectTable();
	for (int j = n + 1; j >= 1; j--)
	{
		if (*(p + j - 1) == 1)
		{
			n--;
			for (unsigned short i = j; i <= n; i++)
			{
				table[i - 1].surname = table[i].surname;
				table[i - 1].index = table[i].index;
				table[i - 1].birthday.day = table[i].birthday.day;
				table[i - 1].birthday.month = table[i].birthday.month;
				table[i - 1].birthday.year = table[i].birthday.year;
			}
		}
	}
	Output();
}
//Зміна даних в таблиці---------------------------------------------------------------------
void updateTable()
{
	short num;
	char lastname[10];
	cout << "Input number of the row: ";
	cin >> num;
	system("cls");
	Output();
	cout << setw(2) << setiosflags(ios::left) << num << " ";
	cout << setw(10) << setiosflags(ios::left) << table[num - 1].surname << " " << table[num - 1].index << " ";
	cout << setw(2) << table[num - 1].birthday.day << " " << setw(2) << table[num - 1].birthday.month << " " << setw(4) << table[num - 1].birthday.year << endl;
	cout << endl << "Enter new surname: ";
	cin >> lastname;
	table[num - 1].surname = lastname;
	cout << endl << "Enter new initial: ";
	cin >> table[num - 1].index;
	cout << endl << "Enter new  day: ";
	cin >> table[num - 1].birthday.day;
	cout << endl << "Enter new  month: ";
	cin >> table[num - 1].birthday.month;
	cout << endl << "Enter new  year: ";
	cin >> table[num - 1].birthday.year;
	Output();
}
short choiceInput(short &ch)
{
	bool check = 0;
	do {
		cin >> ch;
		if ((ch >= 1) && (ch <= 4))
		{
			check = 1;
		}
		else
			printf("\nIncorrect input!\n");
	} while (!check);
	return ch;
}


