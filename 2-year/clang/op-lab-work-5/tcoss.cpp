#include "TCosS.h"

TCosS::TCosS() {}

TCosS::TCosS(double var)
{
	x = var;
}

double TCosS::calculate()
{
	return cos(x);
}