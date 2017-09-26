#pragma once
#include <cmath>
#include <iostream>
class TFunct {
protected:
	double x;
public:
	TFunct() {}
	virtual double calculate() = 0;
};
