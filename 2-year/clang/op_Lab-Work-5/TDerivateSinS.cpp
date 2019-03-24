#include "TDerivateSinS.h"


TDerivateSinS::TDerivateSinS() {}

TDerivateSinS::TDerivateSinS(double var)
{
	x = var;
}

double TDerivateSinS::calculate() 
{
	return cos(x);
}