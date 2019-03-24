#pragma once

#include "Human.h"
class Parent :
	public Human
{
	int amount_to_pay = 0;
	bool paid = false;
public:
	Parent();
	Parent(string name, string surname);
	Parent(Parent&);

	void set_money(int amount);
	void set_paid(bool val);

	int get_money();
	bool get_paid();
	void info();

	~Parent();
};

