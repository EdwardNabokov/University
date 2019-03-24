#include "Doctor.h"



Doctor::Doctor()
{
}

Doctor::Doctor(string n, string s) : Human(n, s) {};

void Doctor::info() {
	cout << get_name() << " " << get_surname() << endl;
}

Doctor::~Doctor()
{
}
