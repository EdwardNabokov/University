#pragma once
#include <iostream>
#include <string>
#include <vector>
using namespace std;
class Human
{
	string name = "Not given";
	string surname = "Not given";
public:
	Human();
	Human(string n, string s);

	void set_name(string n);
	void set_surname(string s);
	
	string get_name();
	string get_surname();

	virtual void info();

	~Human();
};

