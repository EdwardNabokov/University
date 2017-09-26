#include "TSinS.h"

TSinS::TSinS() {}
TSinS::TSinS(double var)
{
	x = var;
}
double TSinS::calculate() {
	return sin(x);
}