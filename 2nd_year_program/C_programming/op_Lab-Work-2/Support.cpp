#include <iostream>
#include <stdio.h>
#include <ctime>
#include <string>
#include <fstream>
#include "Support.h"
using namespace std;


void CDecode::enCaesar(char *text, int key)
{
	for (int i = 0; i < strlen(text); i++)
	{
		if (text[i] == ' ')
			i += 1;
		if (text[i] >= 'A' && text[i] <= 'Z')
		{
			text[i] = text[i] + (char)key;
			if (text[i] > 'Z')
				text[i] = 'A' + (text[i] - 'Z') - 1;
		}
		if (text[i] >= 'a' && text[i] <= 'z')
		{
			text[i] = text[i] + (char)key;
			if (text[i] > 'z' || text[i] < 'A')
				text[i] = 'a' + (text[i] - 'z') - 1;
		}
	}
}
void CDecode::deCaesar(char *text, int key)
{
	for (int i = 0; i < strlen(text); i++)
	{
		if (text[i] >= 'A' && text[i] <= 'Z')
		{
			text[i] = text[i] - (char)key;
			if (text[i] < 'A') text[i] = 'Z' - ('A' - text[i]) + 1;
		}
		if (text[i] >= 'a' && text[i] <= 'z')
		{
			text[i] = text[i] - (char)key;
			if (text[i] < 'a') text[i] = 'z' - ('a' - text[i]) + 1;

		}
	}
}

void CDecode::enFransisBackon(char  *text)
{
	char code[10] = "";
	FILE *s;
	s = fopen("in.txt", "w+");
	for (int i = 0; i < strlen(text); i++)
	{
	
		if (!isdigit(text[i]) && isalpha(text[i]) && text[i] != ' ')
		{
			text[i] = tolower(text[i]);
			strcpy(code, get_code(text[i]));
			cout << endl << code;
			fprintf(s, "%s", code);
		}
	}
	rewind(s);
	fgets(text, 1000, s);
	fclose(s);
	remove("in.txt");
}
void CDecode::deFransisBackon(char *text)
{
	char ABC[] = "abcdefghijklmnopqrstuvwxyz";
	FILE *f = fopen("input.txt", "w+");
	FILE *s = fopen("output.txt", "w+");
	//fwrite(text, sizeof(text), 100, f); all of string
	char bin_bit;

	for (int i = 0; i < strlen(text); i++)
	{
		if (text[i] == 'A')
			bin_bit = '0';
		if (text[i] == 'B')
			bin_bit = '1';
		fprintf(f, "%c", bin_bit);
	}

	char code[10] = "";
	rewind(f);
	for (int i = 0; i < strlen(text) - 4; i += 5)
	{
		fgets(code, 6, f);
		int bin_code;
		sscanf(code, "%d", &bin_code); //conver string to int
		int decimal = 0;
		cout << "Binary: " << bin_code << "     ";
		decimal = bin_to_dec(bin_code);
		cout << "Decimal: " << decimal << endl;
		fprintf(s, "%c", ABC[decimal]);
	}
	fclose(s);
	s = fopen("output.txt", "r");
	fscanf(s, "%s", text);
	fclose(s);
	fclose(f);
	/*remove("input.txt");
	remove("output.txt"); */
}

void CDecode::enMatr(char *text, Matrix key)
{
	char b[100], a[100];
	FILE *p;
	p = fopen("enMatr.txt", "w+");
	int flag = 0;
	for (int i = 0; i < strlen(text); i++)
	{
		if (text[i] == ' ')
			i += 1;
		flag = 0;
		if (isalpha(text[i]) || text[i] == ' ')
			for (int j = 0; j < 6; j++)
			{
				for (int z = 0; z < 6; z++)
					if (tolower(text[i]) == key[j][z])
					{
						///p << char(j + 1) << char(z + 
						sprintf(a, "%d", j + 1);
						sprintf(b, "%d", z + 1);
						fprintf(p, "%s", a);
						fprintf(p, "%s", b);
						flag = 1;
						if (flag)
							break;
					}
				if (flag)
					break;
			}

	}
	rewind(p);
	fgets(text, strlen(text) * 36, p);
	//cout << "Encrypted text: " << text << endl;
	fclose(p);
	remove("enMatr.txt");
}
void CDecode::deMatr(char *text, Matrix key)
{
	char a;
	FILE *p;
	p = fopen("deMatr.txt", "w+");
	int row, col;

	for (int i = 0; i < strlen(text) - 1; i += 2)
	{
		row = text[i] - 48;
		col = text[i + 1] - 48;
		char a = key[row - 1][col - 1];
		fprintf(p, "%c", a);
	}
	rewind(p);
	fgets(text, strlen(text) * 36, p);
	fclose(p);
	remove("deMatr.txt");
}

void keyGenerator(Matrix &Mkey, int key)
{
	char initial = 'a' + (char)key;
	for (int i = 0; i < 6; i++)
	{
		for (int j = 0; j < 6; j++)
		{
			initial += (char)1;
			Mkey[i][j] = initial;
			if (Mkey[i][j] > 'z')
			{
				initial = 'a';
				Mkey[i][j] = initial;
			}

		}
	}
	Mkey[6][6] = ' ';
	for (int i = 0; i < 6; i++)
	{
		for (int j = 0; j < 6; j++)
			cout << Mkey[i][j] << " ";
		cout << endl;
	}
}

char *get_code(char ch)
{
	switch (ch)
	{
	case 'a': return "AAAAA"; break; //0
	case 'b': return "AAAAB"; break; //1
	case 'c': return "AAABA"; break; //2
	case 'd': return "AAABB"; break;//3
	case 'e': return "AABAA"; break;//4
	case 'f': return "AABAB"; break;//5
	case 'g': return "AABBA"; break;//6
	case 'h': return "AABBB"; break;//7
	case 'i': return "ABAAA"; break;//8
	case 'j': return "ABAAB"; break;//9
	case 'k': return "ABABA"; break;//10
	case 'l': return "ABABB"; break;//11
	case 'm': return "ABBAA"; break;//12
	case 'n': return "ABBAA"; break;//13
	case 'o': return "ABBBA"; break;//14
	case 'p': return "ABBBB"; break;//15
	case 'q': return "BAAAA"; break;//16
	case 'r': return "BAAAB"; break;//17
	case 's': return "BAABA"; break;//18
	case 't': return "BAABB"; break;//19
	case 'u': return "BABAA"; break;//20
	case 'v': return "BABAB"; break;//21
	case 'w': return "BABBA"; break;//22
	case 'x': return "BABBB"; break;//23
	case 'y': return "BBAAA"; break;//24
	case 'z': return "BBAAB"; break;//25
	}
	return "0";
}

int bin_to_dec(int bin_code)
{
	int rem = 0;
	int decimal = 0;
	int index = 0;
	while (bin_code != 0)
	{
		rem = bin_code % 10;
		bin_code /= 10;
		decimal += rem * pow(2, index);
		++index;
	}
	return decimal;
}

void analyzeCaesar(char *encodedText)
{

	cout << endl;
	clock_t start_time = clock();
	int key = 0;
	while (key != 26)
	{
		for (int i = 0; i < strlen(encodedText); i++)
		{
			if (!isalpha(encodedText[i]))
				i += 1;
			if (encodedText[i] == ' ')
				i += 1;
			encodedText[i] += (char)1;
			if (tolower(encodedText[i]) == 'z')
				encodedText[i] = 'a';

		}
		key += 1;
		//output time
		cout << key << ": " << encodedText << " --- [time of executing: " << (double)(clock() - start_time) / CLOCKS_PER_SEC << " s]" << endl;
	}
}
void analyzeFB(char *encodedText)
{
	char Abc[] = "abcdefghijklmnopqrstuvwxyz";
	cout << endl;
	clock_t start_time = clock();
	FILE *f = fopen("input.txt", "w+");
	FILE *o = fopen("output.txt", "w+");
	//recording the whole row to the file
	for (int j = 0; j < strlen(encodedText); j++)
	{
		if (toupper(encodedText[j]) != 'A' && toupper(encodedText[j]) != 'B')
		{
			cout << "\nWrong method for such decryption!\n";
			return;
		}

		if (toupper(encodedText[j]) == 'A')
			encodedText[j] = '0';
		if (toupper(encodedText[j]) == 'B')
			encodedText[j] = '1';
		fputc(encodedText[j], f);
	}
	rewind(f); int flag = 0;
	//make prediction that  that is binary system but 0 is A, 1 - B
	//check the correctness of char row
	char code[100] = "";
	int bin_code;
	if (strlen(encodedText) % 5 == 0)
	{
		flag = 1;
		for (int i = 0; i < strlen(encodedText) - 4; i += 5)
		{
			fgets(code, 6, f);
			sscanf(code, "%d", &bin_code);
			int decimal = 0;
			cout << "Binary: " << bin_code << "     ";
			decimal = bin_to_dec(bin_code);
			cout << "Decimal: " << decimal << endl;
			fprintf(o, "%c", Abc[decimal]);
		}
		fclose(o);
		o = fopen("output.txt", "r");
		fscanf(o, "%s", encodedText);
		fclose(o);
		fclose(f);
		//output of time
		cout << "Result: " << encodedText << " --- [time of executing: " << (double)(clock() - start_time) / CLOCKS_PER_SEC << " s]" << endl;
		return;
	}
	if (!flag)
	{
		fclose(o);
		fclose(f);
	}
}
void analyzeMatr(char* encodedText)
{
	FILE *s; //= fopen("smth.txt", "w+");
	Matrix abc;
	int key = 0;
	clock_t start_time = clock();
	int row, col;
	char a;
	char result[100];
	for (int i = 0; i < strlen(encodedText); i++)
	{
		if (isalpha(encodedText[i]))
		{
			cout << "\nWrong method for such encryption\n";
			return;
		}
	}
	if (strlen(encodedText) % 2 == 0)
	{
		while (key != 26)
		{
			s = fopen("smth.txt", "w+");
			cout << key + 1 << ": " << endl;
			keyGenerator(abc, key);

			row = 0, col = 0;
			for (int i = 0; i < strlen(encodedText) - 1; i += 2)
			{
				row = encodedText[i] - 48;
				col = encodedText[i + 1] - 48;
				a = abc[row - 1][col - 1];
				fputc(a, s);
			}
			rewind(s);
			fgets(result, strlen(encodedText) * 36, s);
			//output time
			cout << result << " --- [time of executing: " << (double)(clock() - start_time) / CLOCKS_PER_SEC << " s]" << endl << endl;
			key += 1;
			fclose(s);
			//remove("smth.txt");
		}
	}
}