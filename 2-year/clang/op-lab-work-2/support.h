#pragma once
#pragma warning (disable : 4996)
typedef char Matrix[25][25];
using namespace std;
class CDecode
{
private:
	char t[1000];
public:
	//constructor by default
	CDecode()
	{
		strcpy(t, "empty");
	}
	//get function  of char*
	char * getT()
	{
		cout << "Enter the sentence: ";
		gets_s(t, 100);
		return t;
	}
	// methods of encryption
	void enCaesar(char  *text, int key);
	void enFransisBackon(char *text);
	void enMatr(char *text, Matrix);
	//methods of decryption
	void deCaesar(char *text, int);
	void deFransisBackon(char *text);
	void deMatr(char *text, Matrix);
	//destructor of class
	~CDecode() {}
};


//analyzing of different methods
void analyzeCaesar(char*);
void analyzeFB(char *);
void analyzeMatr(char *);

//generator for key for shifting of Matrix creation
void keyGenerator(Matrix &, int);
char *get_code(char); //convert letter to binary code
int bin_to_dec(int); //func that implemented for coverting binary number to decimal
