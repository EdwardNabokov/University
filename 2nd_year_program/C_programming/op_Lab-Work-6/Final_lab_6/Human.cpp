#include "Human.h"


Human::Human()
{
}

Human::Human(string n, string s) {
	name = n;
	surname = s;
}

void Human::set_name(string n) {
	name = n;
}

void Human::set_surname(string s) {
	surname = s;
}

string Human::get_name() {
	return name;
}

string Human::get_surname() {
	return surname;
}

void Human::info() {
	cout << "BaseClass info" << endl;
}

Human::~Human()
{
}
