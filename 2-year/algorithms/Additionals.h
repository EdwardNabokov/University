#pragma once
#include "Prototypes.h"
#include <iostream>
#include <fstream>
#include <iomanip>
#include <ctime>
#include <locale>
#pragma warning (disable : 4996)
using namespace std;
extern int rows;
TStudent Tables[20];
extern char *SURNAMES[];
extern int c;
TStudent *search_table[20];


void createTable()
{
	srand(time(0));
	ifstream line;
	line.open("Data.txt");
	Tables[0].key = rand() % 20 + 1;
	for (int i = 0; i < rows; i++)
	{
		Tables[i+1].key = getKey(i);
		strcpy(Tables[i].surname, SURNAMES[i]);
		line >> Tables[i].name;
		line >> Tables[i].initial;
		line >> Tables[i].birth.day;
		line >> Tables[i].birth.month;
		line >> Tables[i].birth.year;
		line >> Tables[i].marks.DS;
		line >> Tables[i].marks.Math;
		line >> Tables[i].marks.Program;
	}
	line.close();
}
int getKey(int s)
{
	int account = 0;
	unsigned short r;
	r = rand() % 20 + 1;
	for (int i = 0; i < s + 1; i++)
		if (Tables[i].key == r)
		{
			r = rand() % 20 + 1;
			i = 0;
		}
	return r;
}
void outputTable()
{
	printf("\t\t\t\t <Table>\n");
	cout << setw(70) << setfill('-') << "-" << endl;
	printf("\nN  Key  Surname    Name\t Initial  DS  Program Math   Birthday");
	for (int i = 0; i < rows; ++i)
	{
		printf("\n%-3d", i + 1);
		printf("%-5d", Tables[i].key);
		printf("%-11s", Tables[i].surname);
		printf("%-6s", Tables[i].name);
		printf("   %-c\t ", Tables[i].initial);
		printf("  %-5d %-4d  %-3d", Tables[i].marks.DS, Tables[i].marks.Program, Tables[i].marks.Math);
		printf("  %-4d%-3d%-d", Tables[i].birth.day, Tables[i].birth.month, Tables[i].birth.year);
	}
	cout << endl << setw(70) << setfill('-') << "-" << endl << endl;


}
int choice(int minimum, int maximum)
{
	int num;
	do
	{
		scanf("%d", &num);
		int check = 0;

		if ((num >= minimum && num <= maximum) && (!isalpha(num)))
		{
			check++;
			return num;

		}
		if (!check)
		{
			system("cls");
			outputTable();
			cout << "\nIncorrect input! Try again: ";
		}
	} while (true);
}
int selectTable()
{
	printf("\nChoose data by:\n[1] -> Number\n[2] -> Surname\n[3] -> Initial\nYour choice: ");
	int min = 1, max = 3;
	c = 0;
	switch (choice(min, max))
	{
	case 1:
	{
		int n;
		cout << "\nEnter Number: ";
		if (testNum(n) == true)
			do
			{
				if (Tables[c].key == n)
					return c;
				else
					c++;
			} while (!(c == rows + 1));
		else
			selectTable();
		break;
	}
	case 2:
	{
		cout << "\nEnter Surname: ";
		char sur[15];
		if (testString(sur) == true)
			do {

				if (strcmp(Tables[c].surname, sur) == 0)
				{
					return c;
				}
				else
					c++;

			} while (!(rows + 1 == c));

		else
			selectTable();
		break;
	}
	case 3:
	{
		cout << "\nEnter Initial: ";
		char initial;
		if (testSymbol(initial) == true)
		{
			do
			{
				if (Tables[c].initial == initial)
					return c;
				else
					c++;
			} while (!(rows + 1 == c));
		}
		else
			selectTable();
		break;
	}
	}

}
void insertTable()
{
	srand(time(NULL));
	++rows;
	cout << "Key is random!";
	Tables[rows - 1].key = getKey(rows);
	char surn[10];
	cout << "\nEnter new surname: ";
	cin >> surn;
	strcpy(Tables[rows - 1].surname, surn);
	cout << "\nEnter new name: ";
	cin >> Tables[rows - 1].name;
	cout << "\nEnter intial: ";
	cin >> Tables[rows - 1].initial;
	cout << "\nEnter mark of DS: ";
	cin >> Tables[rows - 1].marks.DS;
	cout << "\nEnter mark of Math: ";
	cin >> Tables[rows - 1].marks.Math;
	cout << "\nEnter mark of Program: ";
	cin >> Tables[rows - 1].marks.Program;
	cout << "\nDay of birth: ";
	cin >> Tables[rows - 1].birth.day;
	cout << "\nMonth of birth: ";
	cin >> Tables[rows - 1].birth.month;
	cout << "\nYear of birth: ";
	cin >> Tables[rows - 1].birth.year;
	system("cls");
	outputTable();
}
void deleteTable()
{
	int result = selectTable();	//c
	for (unsigned short i = result + 1; i <= rows; i++)
		Tables[i - 1] = Tables[i];
	rows--;
	system("cls");
	outputTable();
}
void changeTable()
{
	int number;
	char name[10];
	cout << "\nInput number of the row: ";
	if (testRow(number) == true)
	{
		printf("\nN  Key  Surname    Name\t Initial  DS  Program Math   Birthday");
		printf("\n%-3d", number);
		printf("%-5d", Tables[number - 1].key);
		printf("%-11s", Tables[number-1].surname);
		printf("%-6s", Tables[number-1].name);
		printf("   %-c\t ", Tables[number-1].initial);
		printf("  %-5d %-4d  %-3d", Tables[number-1].marks.DS, Tables[number-1].marks.Program, Tables[number-1].marks.Math);
		printf("  %-4d%-3d%-d", Tables[number-1].birth.day, Tables[number-1].birth.month, Tables[number-1].birth.year);

		cout << "\nEnter new last name: "; cin >> name;  strcpy(Tables[number - 1].surname, name);
		cout << endl << "Enter new first name: "; cin >> Tables[number - 1].name;
		cout << endl << "Enter mark of DS: "; cin >> Tables[number - 1].marks.DS;
		cout << endl << "Enter mark of Math: "; cin >> Tables[number - 1].marks.Math;
		cout << endl << "Enter mark of Program: "; cin >> Tables[number - 1].marks.Program;
		cout << endl << "Enter new initial: "; cin >> Tables[number - 1].initial;
		cout << endl << "Enter new  day: "; cin >> Tables[number - 1].birth.day;
		cout << endl << "Enter new  month: "; cin >> Tables[number - 1].birth.month;
		cout << endl << "Enter new  year: "; cin >> Tables[number - 1].birth.year;
		system("cls");
		outputTable();
	}
	else
		changeTable();
}
bool testSymbol(char &c)
{
	int check = 0;
	cin >> c;
	for (int i = 0; i < rows; i++)
	{
		if ((Tables[i].initial == c) && (isalpha(c)))
		{
			check++;
			break;
		}
	}
	if (!check)
	{
		system("cls");
		outputTable();
		cout << "\nThere is no such initial or incorrect input!";
		return false;
	}
	return true;
}
bool testNum(int &num)
{
	cin >> num;
	int check = 0;
	for (int i = 0; i < rows; i++)
	{
		if (Tables[i].key == num) //&& isdigit(num))
		{
			check++;
			break;
		}
	}
	if (!check)
	{
		system("cls");
		outputTable();
		cout << "\nThere is no such key or incorrect input!";
		return false;
	}
	return true;
}
bool testString(char *str)
{
	int check = 0;
	cin >> str;
	for (int i = 0; i < rows; i++)
	{
		if (!strcmp(Tables[i].surname, str))
		{
			check++;
			break;
		}
	}
	if (!check)
	{
		system("cls");
		outputTable();
		cout << "\nThere is no such surname or incorrect input!";
		return false;
	}
	return true;
}
bool testRow(int &num)
{
	cin >> num;
	int check = 0;
	for (int i = 1; i <= rows; i++)
	{
		if (i == num)
		{
			check++;
			break;
		}
	}
	if (!check)
	{
		system("cls");
		outputTable();
		cout << "\nThere is no such number of row!";
		return false;
	}
	return true;
}
void sort()
{
	int n = rows;
	TStudent *swap;
	for (int i = 0; i < rows; i++)
		search_table[i] = &Tables[i];
	for (int c = 0; c < (n - 1); c++)
		for (int d = 0; d < n - c - 1; d++)
			if (strcmp(search_table[d]->surname, search_table[d + 1]->surname) > 0) {
				swap = search_table[d];
				search_table[d] = search_table[d + 1];
				search_table[d + 1] = swap;
			}
}
int searchBySurname(char *str)
{
	int Middle;
	Middle = binarySearch(str);
	return Middle;
}
void searchTable()
{
	sort();
	cout << "Enter surname, that you want to find: ";
	char s[15];
	cin >> s;
	int number = searchBySurname(s);
	cout << "Result using Binary_search: " << endl;
	printf("\nN  Key  Surname    Name\t Initial  DS  Program Math   Birthday");
	printf("\n%-3d", number - 1);
	printf("%-5d", search_table[number - 1]->key);
	printf("%-11s", search_table[number - 1]->surname);
	printf("%-6s", search_table[number - 1]->name);
	printf("   %-c\t ", search_table[number - 1]->initial);
	printf("  %-5d %-4d  %-3d", search_table[number - 1]->marks.DS, search_table[number - 1]->marks.Program, search_table[number - 1]->marks.Math);
	printf("  %-4d%-3d%-d\n", search_table[number - 1]->birth.day, search_table[number - 1]->birth.month, search_table[number - 1]->birth.year);
}
int binarySearch(char *s)
{
	int L = 1, R = rows, M;
	cout << endl;
	while (true)
	{
		if (L > R) {
			cout << "No such person" << endl;
			break;
		}
		else {
			M = (L + R) / 2;
			if (strcmp(search_table[M - 1]->surname, s) == 0)
			{
				return M;
				break;
			}
			else if (strcmp(search_table[M - 1]->surname, s) < 0)
				L = M + 1;
			else
				R = M - 1;
		}
	}
}
void outputSort()
{
	system("cls");
	outputTable();
	sort();
	cout << "Sorted table by surname:" << endl;
	for (int i = 0; i < rows; i++)
		cout << i + 1 << ")"<< setw(5)  << search_table[i]->surname << endl;
	cout << endl;
}
