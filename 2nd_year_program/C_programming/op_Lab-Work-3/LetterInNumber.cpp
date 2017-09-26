#include "LetterInNumber.h"



LPSInNumber::LPSInNumber(string a)
{
	ex = a;
}

void LPSInNumber::ExceptionHandler()
{
	cout << "Exception! Number consists of extra symbols ";
	for (int i = 0; i < ex.size(); i++)
	{
		if (ispunct(ex[i]) || isalpha(ex[i]) || isspace(ex[i]))
			cout << ex[i] << " ";
	}
	cout << "\n";
}