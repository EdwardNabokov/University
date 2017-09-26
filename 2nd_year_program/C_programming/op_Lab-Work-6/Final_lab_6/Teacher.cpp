#include "Teacher.h"



Teacher::Teacher()
{
	cout << "Teacher: the person was created." << endl;
}

Teacher::Teacher(string n, string s) : Human(n, s) {
	cout << "Teacher: the person was created." << endl;
};

Teacher::Teacher(Teacher &t) : Human(t.get_name(), t.get_surname()) {
	cout << "Teacher: the person was created." << endl;
};

Teacher::Teacher(Teacher &t, int amount) : Human(t.get_name(), t.get_surname()), quantity_child(amount) {
	cout << "Teacher: the person was created." << endl;
};

void Teacher::set_documents(vector<Child> *ch) {
	cout << "Teacher: document created." << endl;
	for (int i = 0; i < ch->size(); i++) {
		documents.push_back(Document((*ch)[i]));
	}
}

void Teacher::set_documents_full(vector<Document> *doc) {
	cout << "Teacher: got updated documents." << endl;
	documents = *doc;
}

vector<Document> &Teacher::get_documents() {
	return documents;
}

Document &Teacher::get_document(int i) {
	return documents[i];
}

int Teacher::get_quantity(){
	return documents.size();
}

void Teacher::info() {
	cout << get_name() << " " << get_surname() << endl;
}

void Teacher::info_doc() {
	cout << get_quantity() << endl;
	for (auto &value : documents)
		value.print_child();
}


Teacher::~Teacher()
{
}
