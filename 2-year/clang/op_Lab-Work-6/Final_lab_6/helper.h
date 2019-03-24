#pragma once
#include <ctime>
#include <iostream>
#include <algorithm>
#include "Chief.h"
#include "Group.h"
#include "NumberIncorrect.h"
#include "NumberTooLong.h"
#include "PunctLetterSpace.h"
using namespace std;

const string names[] = { "Brad", "Josh", "Gregory", "Mark", "Marta", "Paul", "Anna", "May", "Hannah", "Tristony", "Nataly", "Chris", "Jacky" };
const string surnames[] = { "Green", "Brown", "Finn", "RD", "Rockors", "Wert", "Alma", "Cred", "Essehn", "Gos", "Dre", "Parker", "Chan" };

void author();
void menu();
void enter_choice(string& choice, int since, int till);
void work_logic(int choice);
void display_everything(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief);
void display_medication(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief);
void display_document(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief);
void display_unaccepted(vector<Parent>& parents, vector<Child> &children, Teacher &teacher, Group &IP_52, Chief &chief);
void fill_random(vector<Child>&, vector<Parent>&, int days);
int get_random(int since, int till);

template<class ...Infos>
class Infor : public Infos...
{
public:
	Infor() {};
	Infor(Infos&...infos) : Infos(infos)... {};
	
	Infor(Infos&&... infos) : Infos(infos)... {};
};