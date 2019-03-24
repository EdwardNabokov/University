#pragma once
#include "Human.h"
#include "Document.h"
class Chief :
	public Human
{
	const float pay = 20.5;
	int quantity_child = 0;
	float total_money = 0;
	vector<Document> documents;
public:
	Chief();
	Chief(string name, string surname);
	Chief(Chief &a);

	void set_quantity(int amount);
	void set_total();
	void set_documents_amount(vector<Document> *);

	vector<Document> &get_documents();
	float get_total();
	int get_quantity();

	void info();
	void info_doc();

	~Chief();
};

