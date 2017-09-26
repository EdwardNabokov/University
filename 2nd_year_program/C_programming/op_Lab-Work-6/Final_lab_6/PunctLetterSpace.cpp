#include "PunctLetterSpace.h"



PunctLetterSpace::PunctLetterSpace()
{
}

PunctLetterSpace::PunctLetterSpace(string ex) {
	PLS = ex;
}

void PunctLetterSpace::exHandler() {
	cout << "Exception occured! ";
	cout << "Number has wrong sign!\n";
}

PunctLetterSpace::~PunctLetterSpace()
{
}
