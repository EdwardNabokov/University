#pragma once
#include "Exception.h"

class NumberIncorrect : public Exception{
	string NumIncorrect;
public:
	NumberIncorrect();
	NumberIncorrect(string );
	void exHandler();
};