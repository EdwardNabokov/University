#include "Document.h"



Document::Document(){}

Document::Document(Child &ch) {
	child = &ch;
}

void Document::set_total(float amount) {
	total_money = amount;
}
void Document::set_child(Child &ch) {
	child = &ch;
}

float Document::get_total() {
	return total_money;
}

Child &Document::get_child() {
	return *child;
}

void Document::print_child() {
	this->get_child().info();
}
void Document::print_pay() {
	cout << "Pay: " << get_total() << endl;
}

Document::~Document()
{
}
