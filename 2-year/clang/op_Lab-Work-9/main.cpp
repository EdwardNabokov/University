#include <iostream>
#include <stdio.h>
#include "furniture.h"

#pragma warning(disable : 4996)
#define _CRT_SECURE_NO_WARNINGS
#define _CRT_SECURE_NO_DEPRECATE

using namespace furniture;

void Menu();


int main()
{
	FILE *database = fopen("database.bin", "rb+");
	system("color F0");

	while (true) {
		mainTable(database);
		Menu();
		int choice;
		scanf("%d", &choice);
		printf("\n\n");

		switch (choice) {
		case 1: addToDatabase(database); system("pause"); break;
		case 2: deleteRecordByName(database); system("pause"); break;
		case 3: searchChairs(database); system("pause"); break;
		case 4: findChairs(database, 100, 500); system("pause"); break;
		case 0: exit(0);
		default: printf("Wrong command!\n"); system("pause"); break;
		};
		system("cls");
	}
	fclose(database);
}

void Menu(void) {
	printf("Menu:\n");
	printf("1: Add new element\n");
	printf("2: Remove elements by name\n");
	printf("3: [1] Search chairs of certain type.\n");
	printf("4: [2] Display chair.\n");
	printf("0: Exit\n");
	printf("Make choice: ");
}
