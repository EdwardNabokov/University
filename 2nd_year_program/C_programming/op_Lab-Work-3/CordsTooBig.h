#pragma once
#include "Exception.h"
class CordsTooBig :	public Exception
{
	string number;
public:
	CordsTooBig(string);
	virtual void ExceptionHandler();
};

