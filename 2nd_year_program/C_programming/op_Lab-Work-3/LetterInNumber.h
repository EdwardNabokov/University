#pragma once
#include "Exception.h"
class LPSInNumber : public Exception
{
	string ex;
public:
	LPSInNumber(string);
	virtual void ExceptionHandler();
};

