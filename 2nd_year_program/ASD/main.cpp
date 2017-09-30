#include <iostream>
#include <string>
#include "Structures.h"
#include "SupFun.h"
using namespace std;

extern int rows = 10;
extern TStudent Tables[20] = { 0 };
extern char *SURNAMES[20] = { "Lunina", "Poberezniy", "Grinko", "Karpova", "Kalinina", "Kush", "Tashuta", "Kozhuhar", "Gupalo", "Sypchenko" };
extern int c = 1;
TStudent *search_table[];

int main()
{

	system("color F0");
	int n;
	createTable();
	outputTable();
	int min = 1, max = 6;
	while (true)
	{
		cout << "[1] -> Insert\n[2] -> Delete\n[3] -> Change\n[4] -> Search\n[5] -> See sorted table by surname\n[6] -> Exit\n";
		n = choice(min, max);
		switch (n)
		{
		case 1: insertTable(); break;
		case 2: deleteTable(); break;
		case 3: changeTable(); break;
		case 4: searchTable(); break;
		case 5: outputSort(); break;
		case 6: exit(0); break;
		}
	}
	system("pause");
}