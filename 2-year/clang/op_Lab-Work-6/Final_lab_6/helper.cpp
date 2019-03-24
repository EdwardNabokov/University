#include "helper.h"

void author() {
	cout << "OOP" << endl;
	cout << "Lab - 6 Templates" << endl;
	cout << "Eduard Nabokov" << endl;
}
void menu() {
	cout << "[1] -> Display every child." << endl;
	cout << "[2] -> Display who's required to bring medical certification." << endl;
	cout << "[3] -> Display document of each child." << endl;
	cout << "[4] -> Display who was unaccepted." << endl;
	cout << "[5] -> Exit" << endl;
}
void enter_choice(string &choice, int since, int till) {
	cin >> choice;

	if (choice.size() > 10)
		throw NumberTooLong(choice);

	for (int i = 0; i < choice.size(); i++)
	{
		if ((ispunct(choice[i]) || isalpha(choice[i]) || isspace(choice[i])) && choice[0] != '-')
			throw PunctLetterSpace(choice);
	}

	if (stoi(choice) <= since || stoi(choice) > till)
	{
		throw NumberIncorrect();
	}
	if (choice > to_string(till))
		throw NumberIncorrect(choice);
}
void work_logic(int choice) {
	srand(time(0));
	string days;
	const int SIZE = 10;
	cout << "Please, enter the number of days (no more than 30): ";
	enter_choice(days, 0, 30);
	Chief chief("Iryna", "Pavlivla");
	Teacher teacher("Alex", "Pavlov");
	vector<Child> children(SIZE);
	vector<Parent> parents(SIZE);
	Group IP_52;
	fill_random(children, parents, 15);
	IP_52.set_children(children);
	IP_52.set_teacher(teacher);
	IP_52.get_teacher().set_documents(&children);
	chief.set_documents_amount(&teacher.get_documents());
	teacher.set_documents_full(&chief.get_documents());
	cout << "Parents: got document from teacher." << endl;
	for (int i = 0; i < parents.size(); i++) {
		parents[i].set_money(teacher.get_document(i).get_total());
	}
	cout << endl;
		switch (choice) {
		case 1: display_everything(parents, children, teacher, IP_52, chief); break;
		case 2: display_medication(parents, children, teacher, IP_52, chief); break;
		case 3: display_document(parents, children, teacher, IP_52, chief); break;
		case 4: display_unaccepted(parents, children, teacher, IP_52, chief); break;
		case 5: exit(1);
		}
}

void display_everything(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief) {
	cout << "EVERYTHING" << endl;
	printf("%5s %-10s %-10s %6s %3s %3s", "N", "Name", "Surname", "Attend", "Med cert", "Pay\n");
	int i = 0;
	Infor<vector<Child>, vector<Document>> common(children, chief.get_documents());
	for_each(common.vector<Child>::begin(), common.vector<Child>::end(),  [=](Child a){
		//printf("%5d %-10s %-10s", i, b.get_name().c_str(), b.get_surname().c_str());
		printf("%5d %-10s %-10s %-6d %2d", i, a.get_name().c_str(), a.get_surname().c_str(), a.get_att(), a.get_med()); //.get_total());
			//a.info();
			cout << endl;
	});
}
void display_medication(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief) {

	cout << "Children that are required to bring med-cert" << endl;
	printf("%5s %-10s %-10s %6s %3s", "N", "Name", "Surname", "Attend", "Med cert\n");
	int i = 0;
	Infor<vector<Child>> medication(children);
	for_each(medication.begin(), medication.end(), [i, medication](Child a) mutable
	{
		//printf("%5d %-10s %-10s", i, b.get_name().c_str(), b.get_surname().c_str());
		if (a.get_med())
		{
			printf("%5d %-10s %-10s %-6d %2d", i, a.get_name().c_str(), a.get_surname().c_str(), a.get_att(), a.get_med());
			//a.info();
			i++;
			cout << endl;
		}
	});

	
}
void display_document(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief) {
	cout << "All documents of every child" << endl;
	printf("%5s %-10s %-10s %6s %3s", "N", "Name", "Surname", "Attend", "Pay\n");
	int i = 0;
	Infor<vector<Document>> documentation(chief.get_documents());
	for_each(documentation.begin(), documentation.end(), [i, documentation](Document a) mutable
	{
		printf("%5d %-10s %-10s %-6d %2f", i, a.get_child().get_name().c_str(), a.get_child().get_surname().c_str(), a.get_child().get_att(), a.get_total());
		//a.info();
		cout << endl;
	});
}
void display_unaccepted(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief) {
	cout << "All children who wasn't accepted." << endl;
	printf("%5s %-10s %-10s %6s %3s", "N", "Name", "Surname", "Pay", "Paid\n");
	int i = 0;
	Infor<vector<Parent>, vector<Child>> documentation(parents, children);
	for_each(documentation.vector<Parent>::begin(), documentation.vector<Parent>::end(), [i, documentation](Parent a) mutable
	{
		if (!a.get_paid())
		{
			printf("%5d %-10s %-10s %-6f %2d", i, a.get_name().c_str(), a.get_surname().c_str(), a.get_money(), a.get_paid());
			//a.info();
			cout << endl;
		}
	});
}
void fill_random(vector<Child> &children, vector<Parent> &parents, int days) {
	cout << "Children: came to kindergarten." << endl;
	int random;
	int attendance;
	bool med;
	for (int i = 0; i < children.size(); i++)
	{
		random = get_random(0, names->size());
		children[i].set_name(names[random]);
		random = get_random(0, names->size());
		parents[i].set_name(names[random]);

		random = get_random(0, surnames->size());
		children[i].set_surname(surnames[random]);
		parents[i].set_surname(surnames[random]);
		attendance = get_random(0, days);
		children[i].set_att(attendance);
		if (attendance <= 3)
			children[i].set_med(true);
		med = get_random(0, 1);
		parents[i].set_paid(med);
	}
}
int get_random(int since, int till) {
	return rand() % till + since;
}

