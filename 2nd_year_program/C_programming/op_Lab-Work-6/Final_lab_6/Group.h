#pragma once
#include "Child.h"
#include "Teacher.h"
#include <vector>
class Group 
{
	vector<Child> children;
	Teacher *teacher;
public:
	Group();
	Group(vector<Child>&, Teacher &);

	void set_children(vector<Child>&);
	void set_teacher(Teacher &);

	int get_amount();
	Teacher &get_teacher();

	void print_children();

	void info();
	void info_doc();

	void operator<<(Child &);
	
	//friend class Teacher;

	~Group();
};

