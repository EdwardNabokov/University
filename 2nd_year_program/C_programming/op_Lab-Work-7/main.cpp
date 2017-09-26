#include <iostream>
#include <string>
#pragma warning(disable : 4996)
using namespace std;

void input(char *); //Input strings
int Amount(char[], char *, char[], char *); //Find words in the main string and amount of them
bool Compare(char *, char[]); //compare words of main string with the given ending by user
int main()
{
	system("color F0");
	char str[100]; //main string
	char Ustr[20]; // ending of word(set of symbols)
	char *lim = ".,/\!?;: "; // punctuation symbols
	char strCpy[100] = " "; // new string 
	int count; // amount of deleted words

	cout << "Input: ";
	input(str);
	input(Ustr);

	count = Amount(str, lim, Ustr, strCpy);
	cout << "New string: " << strCpy << endl; // output string
	cout << "Count: " << count << endl; // output amount
	system("pause");
}
void input(char *str)
{
	cin.getline(str, strlen(str));
}
int Amount(char str[], char *lim, char Ustr[], char *strCpy)
{
	int value = 0;
	char *p;

	p = strtok(str, lim);
	while (p != NULL)
	{
		if (Compare(p, Ustr))
		{
			cout << p << " -> delete" << endl;
			value++;
		}
		else
		{
			strcat(strCpy, p);
			strcat(strCpy, " ");
		}
		p = strtok(NULL, lim);
	}
	return value;
}
bool Compare(char *p, char Ustr[])
{
	if (strlen(p) >= strlen(Ustr)) {
		if (!strcmp(p + (strlen(p) - strlen(Ustr)), Ustr)) {
			return true;
		}
	}
	return false;
}


