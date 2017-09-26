#pragma once
#include "Human.h"
class Child :
	public Human
{
	bool medication = false;
	int attendance = 0;
public:
	Child();
	Child(string name, string surname);


	void set_med(bool m);
	void set_att(int att);

	bool get_med();
	int get_att();

	void info();


	~Child();
};

