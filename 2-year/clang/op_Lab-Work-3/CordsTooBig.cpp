#include "CordsTooBig.h"

using namespace std;

CordsTooBig::CordsTooBig(string a)
{
	number = a;
}

void CordsTooBig::ExceptionHandler() {
	cout << "Exception! Number ";
	for (int i = 0; i < 10; i++)
		cout << number[i];
	cout << "... is too big!\n";
}