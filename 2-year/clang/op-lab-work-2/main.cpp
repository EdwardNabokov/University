#include <iostream>
#include <stdio.h>
#include <ctime>
#include <string>
#include <fstream>
#include "Support.h"

#pragma warning(disable : 4996)
using namespace std;

typedef char Matrix[25][25];


int main()
{
	system("color F0");
	char sentence[1000], initial[100];
	CDecode x;	//creation of object
	strcpy(sentence, x.getT()); //copying from objects' string to simple string
	strcpy(initial, sentence);
	Matrix matrKey;
	int choice;
	int key;
	
	cout << "Choose one of the following methods:\n[1] -> Caesar\n[2] -> Fransis Backon(Binary)\n[3] -> Matrix\n[4] -> Break\n Your choice: "; cin >> choice;
	getchar(); //to catch '\n'
	switch (choice)
	{
	case 1: cout << "Enter key(number): "; cin >> key; key %= 26; x.enCaesar(sentence, key); cout << endl << "Encoded: " << sentence << endl; x.deCaesar(sentence, key); break;
	case 2: x.enFransisBackon(sentence); cout << endl << "Encoded: " << sentence << endl; x.deFransisBackon(sentence); cout << "Decoded: " << sentence << endl; break;
	case 3: cout << "Enter key(number): "; cin >> key; key %= 26; keyGenerator(matrKey, key); x.enMatr(sentence, matrKey); cout << "Encoded: " << sentence << endl; x.deMatr(sentence, matrKey); cout << "Decoded: " << sentence; break;
	case 4: break;
	}

	cout << "\nDecoded!\n";
	cout << "Result of decoding: " << sentence << endl;
	getchar(); //to catch '\n'
	cout << "\n\n\nCRYPTOATTACK!\n";
	cout << "Enter encoded text: ";
	char encoded[100]; 
	gets_s(encoded, 100);
	cout << "Make some predictions to decrypt this " << encoded << " encoded text.\n[1] -> Caesar\n[2] -> Fransis Backon(Binary)\n[3] -> Matrix\n[4] -> break\nYour choice: "; 
	cin >> choice;
	switch (choice)
	{
	case 1: analyzeCaesar(encoded); cout << endl; break; //calling Caesar analyzer
	case 2: analyzeFB(encoded); cout << endl; break; //calling Fransis Backon analyzer
	case 3: analyzeMatr(encoded); cout << endl; break; //calling Matrix analyzer
	case 4: break;
	}
	system("pause");
}

