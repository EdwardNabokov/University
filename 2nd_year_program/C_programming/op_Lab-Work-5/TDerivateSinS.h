#pragma once
#include "TFunct.h"
class TDerivateSinS : public TFunct {
public:
	TDerivateSinS();
	TDerivateSinS(double var);
	double calculate();
};