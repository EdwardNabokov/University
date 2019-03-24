#pragma once
#ifndef POINT_H
#define POINT_H

#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

class Point {
protected:
	double x, y;
public:
	Point();
	Point(double xCord, double yCord);
    Point(string, string);

	void setCords(double xCord, double yCord);
	double getX() const;
	double getY() const;
  	bool validateString(string);

	void displayPoint();

	bool operator==(const Point&);
	bool operator!=(const Point&);
	friend bool operator==(Point&, Point&);
	friend bool operator!=(Point&, Point&);
};

#endif

