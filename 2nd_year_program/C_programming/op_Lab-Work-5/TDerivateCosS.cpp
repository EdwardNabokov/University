#include "TDerivateCosS.h"

TDerivateCosS::TDerivateCosS() {}

TDerivateCosS::TDerivateCosS(double var) {
	x = var;
}

double TDerivateCosS::calculate() {
	return -sin(x);
}