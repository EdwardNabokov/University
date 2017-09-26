#include "Points.h"

Points::Points()
{
	arrayPoint.clear();
	n = 0;
}

Points::Points(Points &a)
{
	n = a.n;
	arrayPoint = a.arrayPoint;
}

Points::Points(Points &&a) : n(move(a.n)), arrayPoint(move(a.arrayPoint))
{}


void Points::operator<<(Point point)
{
	vector<Point>::iterator it;
	it = find(arrayPoint.begin(), arrayPoint.end(), point);
	if (it == arrayPoint.end()) {
		arrayPoint.push_back(point);
		n++;
	}
}
void Points::operator >> (Point point)
{
	vector<Point>::iterator position;
	position = find(arrayPoint.begin(), arrayPoint.end(), point);
	if (position != arrayPoint.end()) {
		arrayPoint.erase(position);
		n--;
	}
}

Points Points::operator+(Points &arr)
{
	Points temp = arr;
	for (int i = 0; i < n; i++)
		temp << arrayPoint[i];
	return temp;
}

void Points::operator+=(Points &arr)
{
	*this = *this + arr;
}

Points Points::operator*(Points &arr)
{
	Points temp;
	vector<Point>::iterator position;

	for (int i = 0; i < arr.n; i++) {
		position = find(arrayPoint.begin(), arrayPoint.end(), arr.arrayPoint[i]);
		if (position != arrayPoint.end())
			temp << arr.arrayPoint[i];
	}
	return temp;
}

void Points::operator*=(Points &arr) {
	*this = *this * arr;
}

Points Points::operator-(Points &arr)
{
	Points temp;
	vector<Point>::iterator position;

	for (int i = 0; i < n; i++) {
		position = find(arr.arrayPoint.begin(), arr.arrayPoint.end(), arrayPoint[i]);
		if (position == arr.arrayPoint.end())
			temp << arrayPoint[i];
	}
	return temp;
}

void Points::operator-=(Points &arr) {
	Points t = *this - arr;
	*this = t;
}

void Points::operator=(Points &arr)
{
	n = arr.n;
	arrayPoint = move(arr.arrayPoint);
}

void Points::operator=(Points &&arr)
{
  n = arr.n;
  arrayPoint = move(arr.arrayPoint);
}

int Points::getN()
{
	return n;
}
void Points::displayArrayPoints()
{
	for (int i = 0; i < n; i++) {
		cout << "Point " << i + 1 << ": ";
		arrayPoint[i].displayPoint();
	}
}