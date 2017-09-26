#pragma once
#include "Human.h"
#include "Document.h"
class Teacher :
	public Human
{
	int	quantity_child = 0;
	vector<Document> documents;
public:
	Teacher();
	Teacher(string n, string s);
	Teacher(Teacher &);
	Teacher(Teacher &, int amount);
	
	void set_documents(vector<Child> *);
	void set_documents_full(vector<Document> *);

	int get_quantity();
	vector<Document> &get_documents();
	Document &get_document(int i);

	void info();
	void info_doc();

	~Teacher();
};

