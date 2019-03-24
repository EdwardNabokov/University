#include "Child.h"


Child::Child()
{
}

Child::Child(string n, string s) : Human(n, s) {};

void Child::set_med(bool med) {
	medication = med;
}

void Child::set_att(int att) {
	attendance = att;
}

bool Child::get_med() {
	return medication;
}

int Child::get_att() {
	return attendance;
}

void Child::info() {
	cout << "Child: " << get_name() << " " << get_surname() << " " << get_med() << " " << get_att() << endl;
}

Child::~Child()
{
}
