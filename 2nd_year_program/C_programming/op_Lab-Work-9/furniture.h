#pragma once
#ifndef LAB_9_2_FURNITURE_H
#define LAB_9_2_FURNITURE_H


#include <stdio.h>

namespace furniture {

	// String representation of enum values

	enum NAMES { Chair, Table };

	// Common properties
	enum COLOR { White, Black, Brown, Green, Blue, Yellow, Red, No };

	enum MATERIAL { Wood, Plastic, Glass };

	enum TYPE { Kitchen, Bar, Office, Computer };

	//Chair properties

	enum SEAT { Soft, Solid };

	enum BACK { Strait, Curved };

	//Table properties

	enum TABLETYPE { Round, Square, Rectangular, Oval, another };
}

struct item
{
	furniture::NAMES kind;
	char name[50];
	furniture::TYPE type;
	furniture::MATERIAL material;
	furniture::COLOR color;
	int price;
	int quantity;
	union {
		struct {
			furniture::SEAT typeOfSeat;
			furniture::BACK typeOfBack;
			furniture::COLOR colorOfOvercast;
		} chair;
		struct {
			furniture::TABLETYPE tableType;
			unsigned int length;
			unsigned int width;
			unsigned int height;
		} table;
	};
};


// Functions
void printItem(item&);
void addItem(FILE *, item*);
void mainTable(FILE *);
void deleteRecordByName(FILE*);
void printEnum(char**, int);
item fillRecord();
int testInputNumber(int);
void addToDatabase(FILE *);
void findChairs(FILE *, int, int);
void searchChairs(FILE *);
#endif //LAB_9_2_FURNITURE_H
