#include "Parent.h"

Parent::Parent()
{}

Parent::Parent(string n, string s) : Human(n, s) {
	cout << "Parent: the person was created." << endl;
};

Parent::Parent(Parent& p) {
	this->set_name(p.get_name());
	this->set_surname(p.get_surname());
	this->set_money(p.get_money());
}

void Parent::set_money(int amount) {
	amount_to_pay = amount;
}
void Parent::set_paid(bool val) {
	paid = val;
}

int Parent::get_money() {
	return amount_to_pay;
}
bool Parent::get_paid() {
	return paid;
}


void Parent::info() {
	cout << get_name() << " " << get_surname() << " " << get_money() << " " << get_paid() << endl;
}

Parent::~Parent()
{
}
