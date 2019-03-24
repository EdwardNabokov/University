#pragma once
#include "Human.h"
class Doctor :
	public Human
{
public:
	Doctor();
	Doctor(string name, string surname);

	void info();

	~Doctor();
};

