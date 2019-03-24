#pragma once
#include "TFunct.h"
class TDerivateCosS : public TFunct {
public:
	TDerivateCosS();
	TDerivateCosS(double var);

	double calculate();
};