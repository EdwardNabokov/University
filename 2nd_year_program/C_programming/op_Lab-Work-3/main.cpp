#include "helper.h"

int main() {
	system("color F0");
	int answer;
	display_info();
	Points arr1 = test_set1();
	Points arr2 = test_set2();
	cout << "Set 1:" << endl;
	arr1.displayArrayPoints();
	cout << endl;
	cout << "Set 2:" << endl;
	arr2.displayArrayPoints();
	cout << endl;
	answer = display_menu();
	while (true) {
		if (answer == 6)
			break;
		work_logic(answer, arr1, arr2);
		answer = display_menu();
	}
}