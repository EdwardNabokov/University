#include "Family.h"

Family::Family()
{
}

Family::Family(Parent& p, Child& ch) {
	parent = &p;
	child = &ch;
}

void Family::set_child(Child &a) {
	child = &a;
}

void Family::set_parent(Parent &a) {
	parent = &a;
}

Parent &Family::get_parent() {
	return *parent;
}

Child &Family::get_child() {
	return *child;
}

void Family::info() {
	cout << "Parent: "; parent->info();
	child->info();
	cout << endl;
}

Family::~Family()
{
}
