#include "Chief.h"

Chief::Chief()
{
	cout << "Chief: the person was created." << endl;
}

Chief::Chief(string n, string s) : Human(n, s) {
	cout << "Chief: the person was created." << endl;
};

Chief::Chief(Chief &a) {
	this->total_money = a.total_money;
	this->documents = a.documents;
	this->quantity_child = a.quantity_child;
}

void Chief::set_quantity(int amount) {
	quantity_child = amount;
}
void Chief::set_total() {
	for (int i = 0; i < documents.size(); i++) {
		total_money += documents[i].get_total();
	}
}

void Chief::set_documents_amount(vector<Document> *doc) {
	cout << "Chief: got an amount of documents." << endl;
	documents.resize(doc->size());
	for (int i = 0; i < doc->size(); i++) {
		documents[i].set_total(pay * (*doc)[i].get_child().get_att());
		documents[i].set_child((*doc)[i].get_child());
	}
	set_total();
}

float Chief::get_total() {
	return total_money;
}
int Chief::get_quantity() {
	return quantity_child;
}
vector<Document> &Chief::get_documents() {
	return documents;
}

void Chief::info() {
	cout << get_name() << " " << get_surname() << endl;
}
void Chief::info_doc() {
	cout << "Total amount of money: " << get_total() << endl << endl;
	printf("%5s %-10s %-10s %6s", "N", "Name", "Surname", "Pay\n");
	int i = 0;
	for (auto &value : documents)
	{
		//cout << value.get_child().get_name() << endl;
		i++;
		printf("%5d %-10s %-10s %6.3f", i, value.get_child().get_name().c_str(), value.get_child().get_surname().c_str(), value.get_total());
		cout << endl;
	}
}

Chief::~Chief()
{
}
