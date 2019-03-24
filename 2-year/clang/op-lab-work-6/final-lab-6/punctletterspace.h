#pragma once
#include "Exception.h"
class PunctLetterSpace :
	public Exception
{
	string PLS;
public:
	PunctLetterSpace();
	PunctLetterSpace(string ex);

	void exHandler();
	~PunctLetterSpace();
};

