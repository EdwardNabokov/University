#include "furniture.h"
#include <iostream>
#pragma warning(disable : 4996)
#define _CRT_SECURE_NO_WARNINGS
#define _CRT_SECURE_NO_DEPRECATE

using namespace furniture;

char* item_name[] = { "Chair", "Table" };

// Common properties
char* item_color[] = { "White", "Black", "Brown", "Green", "Blue", "Yellow", "Red", "No" };
char* item_material[] = { "Wood", "Plastic", "Glass" };
char* item_type[] = { "Kitchen", "Bar", "Office", "Computer" };

//Chair properties
char* seat_type[] = { "Soft", "Solid" };
char* back_type[] = { "Strait", "Curved" };

//Table properties
char* table_type[] = { "Round", "Square", "Rectangular", "Oval", "another" };


//Functions

// Add item to database
void addItem(FILE* input, item *record) {
	fseek(input, 0, SEEK_END);
	fwrite(record, sizeof(item), 1, input);
}

//Display table
void mainTable(FILE *input)
{
	item table;
	int size;
	fseek(input , 0, SEEK_END);
	size = (int)(ftell(input) / sizeof(item));

	printf(" N | Kind |    Name    |  Type  | Material | Color | Price | Quantity | Seat | Back | Color of cover | Table type | Length | Width | Height |\n");
	for (int i = 0; i < size; i++)
	{
		fseek(input, sizeof(item)*i, SEEK_SET);
		fread(&table, sizeof(item), 1, input);
		printf(" %-2d|", i + 1);
		printItem(table);
	}
	printf("\n\n");
}

// Display item
void printItem(item &table) {
	printf("%-6s|", item_name[table.kind]);
	printf("%-12s|", table.name);
	printf("%-8s|", item_type[table.type]);
	printf("%-10s|", item_material[table.material]);
	printf("%-7s|", item_color[table.color]);
	printf(" %-6d|", table.price);
	printf(" %-9d|", table.quantity);

	if (table.kind == 0)
	{
		printf("%-6s|", seat_type[table.chair.typeOfSeat]);
		printf("%-6s|", back_type[table.chair.typeOfBack]);
		if (table.chair.colorOfOvercast != furniture::COLOR::No)
			printf("      %-10s|", item_color[table.chair.colorOfOvercast]);
		else
			printf("        -       |");
		printf("      -     |"); //table type
		printf("    -   |"); // table length
		printf("   -   |"); //width
		printf("   -    |"); // height
	}
	else
	{
		printf("  -   |"); // seat type
		printf("  -   |"); //back type
		printf("        -       |"); //item color
		printf("%-12s|", table_type[table.table.tableType]); //table type
		printf("  %-6d|", table.table.length);
		printf("  %-5d|", table.table.width);
		printf("  %-6d|", table.table.height);
	}
	printf("\n");
}

//Remove from database all records with "searchname" or enter number of the string
void deleteRecordByName(FILE* table) {
	int number;
	int size;
	fseek(table, 0, SEEK_END);
	size = (int)(ftell(table) / sizeof(item));
	fseek(table, 0, SEEK_SET);

	printf("Enter number of the string you want to delete: ");
	do
	{
		scanf("%d", &number);
	} while (number >= size && number < 1);

	fseek(table, 0, SEEK_SET);

	FILE *out;
	item record;
	int iteraction = 0;
	out = fopen("tmp.bin", "ab");
	while (fread(&record, sizeof(item), 1, table) != NULL)
	{
		iteraction++;
		if (iteraction != number)
		{
			fwrite(&record, sizeof(item), 1, out);
		}
	}
	std::cout << fclose(table) << "\n" << fclose(out) << "\n";
	if (remove("database.bin") != 0)
		perror("\nError in deletion file.\n");
	else
		printf("\nSuccessfully removed\n");
	if (rename("tmp.bin", "database.bin") == 0)
		printf("\nSuccessfully renamed\n");
	table = fopen("database.bin", "rb+");
}

//Display Enum values
void printEnum(char** list, int size) {
	for (int i = 0; i < size; i++)
		printf(" |%d - %s", i + 1, list[i]);
	printf("|");
}

// Fill structure with input data
item fillRecord() {
	item record;
	char input[2];
	printf("Kind of item: ");
	printEnum(item_name, sizeof(item_name) / sizeof(char*));
	record.kind = static_cast <NAMES> (testInputNumber(sizeof(item_name) / sizeof(char*)));

	gets_s(record.name); // Catch "\n" escape
	printf("Name: ");
	gets_s(record.name);

	printf("Type of item: ");
	printEnum(item_type, sizeof(item_type) / sizeof(char*));
	record.type = static_cast <TYPE> (testInputNumber(sizeof(item_type) / sizeof(char*)));

	printf("Material: ");
	printEnum(item_material, sizeof(item_material) / sizeof(char*));
	record.material = static_cast <MATERIAL> (testInputNumber(sizeof(item_material) / sizeof(char*)));

	printf("Color: ");
	printEnum(item_color, sizeof(item_color) / sizeof(char*));
	record.color = static_cast <COLOR> (testInputNumber(sizeof(item_color) / sizeof(char*)));

	printf("Price: ");
	scanf("%d", &record.price);

	printf("Quantity: ");
	scanf("%d", &record.quantity);

	if (record.kind == Chair) {
		printf("Type of seat: ");
		printEnum(seat_type, sizeof(seat_type) / sizeof(char*));
		record.chair.typeOfSeat = static_cast <SEAT> (testInputNumber(sizeof(seat_type) / sizeof(char*)));

		printf("Type of back: ");
		printEnum(back_type, sizeof(back_type) / sizeof(char*));
		record.chair.typeOfBack = static_cast <BACK> (testInputNumber(sizeof(back_type) / sizeof(char*)));

		printf("Color of overcast: ");
		printEnum(item_color, sizeof(item_color) / sizeof(char*));
		record.chair.colorOfOvercast = static_cast <COLOR> (testInputNumber(sizeof(item_color) / sizeof(char*)));
	}

	else {
		printf("Type of table: ");
		printEnum(table_type, sizeof(table_type) / sizeof(char*));
		record.table.tableType = static_cast <TABLETYPE> (testInputNumber(sizeof(table_type) / sizeof(char*)));

		printf("Length: ");
		scanf("%d", &record.table.length);

		printf("Width: ");
		scanf("%d", &record.table.width);

		printf("Height: ");
		scanf("%d", &record.table.height);
	}
	return record;
}

// Test input value
int testInputNumber(int maxValue)
{
	int input;
	printf("\nEnter number: ");
	scanf("%d", &input);
	while (input <= 0 || input > maxValue) {
		printf("Wrong number! Try again: ");
		scanf("%d", &input);
	}
	printf("\n");
	return input - 1;
}

//Add record to database
void addToDatabase(FILE *table)
{
	item record = fillRecord();
	addItem(table, &record);
}


void findChairs(FILE *table, int low, int high) {
	fseek(table, 0, SEEK_END);
	int size = (int)(ftell(table) / sizeof(item));

	item fileRecord;
	bool marker = false;

	for (int i = 0; i < size; i++) {
		fseek(table, sizeof(item)*i, SEEK_SET);
		fread(&fileRecord, sizeof(item), 1, table);
		if (fileRecord.kind == 0 &&
			fileRecord.chair.typeOfSeat == Soft &&
			fileRecord.chair.colorOfOvercast == Red &&
			fileRecord.price > low &&
			fileRecord.price < high) {
			printItem(fileRecord);
			marker = true;
		}
	}
	if (!marker)
		printf("\nNo such type of chair in the table.\n");
	printf("\n");
}

//find chairs of certain type (office, bar, kitchen , etc...)
void searchChairs(FILE *table)
{
	fseek(table, 0, SEEK_END);
	int size = (int)(ftell(table) / sizeof(item));

	item record;
	item fileRecord;
	printf("Type of item: ");
	printEnum(item_type, sizeof(item_type) / sizeof(char*));
	record.type = static_cast <TYPE> (testInputNumber(sizeof(item_type) / sizeof(char*)));
	int count = 0;
	bool check = false;
	for (int i = 0; i< size; i++)
	{
		fseek(table, sizeof(item)*i, SEEK_SET);
		fread(&fileRecord, sizeof(item), 1, table);

		if (fileRecord.kind == Chair && fileRecord.type == record.type)
		{
			printf("Item: %s\n", item_name[0]);
			printf("Name: %s\n", fileRecord.name);
			printf("Price: %d\n", fileRecord.price);
			printf("Quantity: %d\n", fileRecord.quantity);
			printf("\n");
			check = true;
		}
	}
	if (!check)
		printf("\nNo such type of chair in the table.\n\n");
}
