#ifndef POINTS_H
#define POINTS_H

#include "Point.h"
#include <vector>

class Points {
	int n;
	vector<Point>arrayPoint;
public:
	Points();
	Points(Points &a);
	Points(Points &&a);

	void displayArrayPoints();
	int getN();

	void operator<<(Point point);
	void operator >> (Point point);
	Points operator+(Points &arr);
	void operator+=(Points &arr);
	Points operator*(Points &arr);
	void operator*=(Points &arr);
	Points operator-(Points &arr);
	void operator-=(Points &arr);
	void operator=(Points &arr);
    void operator=(Points &&arr);
};

#endif