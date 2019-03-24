#include "Group.h"

Group::Group()
{
}

Group::Group(vector<Child>& ch, Teacher &t) {
	children = ch;
	teacher = &t;
}

void Group::set_children(vector<Child>& ch) {
	children = ch;
}
void Group::set_teacher(Teacher& t) {
	teacher = &t;
}

int Group::get_amount() {
	return children.size();
}
Teacher &Group::get_teacher() {
	return *teacher;
}


void Group::print_children() {
	for (int i = 0; i < children.size(); i++) {
		children[i].info();
	}
}

void Group::info() {
	cout << "Teacher: ";
	teacher->info();
	for (auto &value : children)
		value.info();
}

void Group::info_doc() {
	teacher->info_doc();
}

void Group::operator<<(Child &t) {
	this->children.push_back(t);
}

Group::~Group(){
}
