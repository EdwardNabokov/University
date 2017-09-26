#pragma once
#include "Child.h"
#include "Parent.h"
class Document 
{

	float total_money = 0;
	Child *child;
public:
	Document();
	Document(Child &ch);

	void set_total(float amount);
	void set_child(Child&);

	float get_total();
	Child &get_child();

	void print_child();
	void print_pay();

	~Document();
};

