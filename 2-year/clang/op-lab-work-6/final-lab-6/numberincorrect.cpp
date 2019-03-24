#include "NumberIncorrect.h"
NumberIncorrect::NumberIncorrect(){};

NumberIncorrect::NumberIncorrect(string Except) {
	NumIncorrect = Except;
}

void NumberIncorrect::exHandler() {
	cout << "Exception occured! ";
	cout << "Number is incorrect!" << endl;
}