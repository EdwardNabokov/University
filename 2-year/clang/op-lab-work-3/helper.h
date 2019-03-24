#pragma once
#ifndef HELPER_H
#define HELPER_H

#include "Points.h"

void display_info();
int display_menu();
void work_logic(int answer, Points&, Points&);
void add_point(Points&);
void remove_point(Point&);
Points test_set1();
Points test_set2();
void make_action(Points&, Points&);
bool is_number(const std::string &s);
int getNumber(int bound);

#endif