#include <stdio.h>
#include <iostream>
#pragma warning(disable : 4996)
using namespace std;
void fill(FILE *); // fill file
void findWords_fill(FILE *, FILE *, char &); //find words with the relevant initial letter
void showContent(char*); //
int main()
{
	system("color F0");
	char letter;
	FILE *firstFile, *lastFile; //pointers on first file(input) and  second file(result)
	firstFile = fopen("input.txt", "w+"); //creating first file
	fill(firstFile); //fill with data
	fclose(firstFile); //close file 
	firstFile = fopen("input.txt", "r");
	lastFile = fopen("result.txt", "w+");
	findWords_fill(firstFile, lastFile, letter);
	fclose(firstFile);
	fclose(lastFile);
	cout << "Initial file consists of such data: \n";
	showContent("input.txt"); //output the content of file
	cout << "\nOutput file consists of such data: \n";
	showContent("result.txt"); //the same as previous action
	cout << endl;
	system("pause");
}
void fill(FILE *first)
{
	char str[256];
	char ch;
	cout << "Input sentences: \n";
	do
	{
		ch = getchar();
		if (ch != 26)
		{
			if (ch == '\r')
				ch = '\n';
			fputc(ch, first);
		}
		else
			break;
	} while (true);
}
void findWords_fill(FILE *first, FILE *second, char &letter)
{
	char *p;
	char str[100];
	cout << "Enter symbol(letter) : "; cin >> letter;
	while (fgets(str, 100, first) != NULL)
	{
		p = strtok(str, ".,;:!? ");
		while (p != NULL)
		{
			if (*p == letter)
			{
				fputs(p, second);
				fputs(" ", second);
				puts(p);
			}
			p = strtok(NULL, ",.:;!? ");
		}
	}
}
void showContent(char *name) {
	FILE *file = fopen(name, "r");
	char c;
	while ((c = fgetc(file)) != EOF) {
		cout << c;
	}
	fclose(file);
}
