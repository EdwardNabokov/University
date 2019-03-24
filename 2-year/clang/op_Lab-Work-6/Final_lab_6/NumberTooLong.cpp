#include "NumberTooLong.h"



NumberTooLong::NumberTooLong(){}

NumberTooLong::NumberTooLong(string ex) {
	NumTooLong = ex;
}

void NumberTooLong::exHandler() {
	cout << "Exception occured! ";
	cout << "Number is too long!" << endl;
}

NumberTooLong::~NumberTooLong()
{
}
