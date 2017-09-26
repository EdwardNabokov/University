#pragma once
#include "Exception.h"
class NumberTooLong :
	public Exception
{
	string NumTooLong;
public:
	NumberTooLong();
	NumberTooLong(string ex);

	void exHandler();
	~NumberTooLong();
};

