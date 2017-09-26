#include "Point.h"
#include "LetterInNumber.h"
#include "CordsTooBig.h"

Point::Point() {
	x = 0;
	y = 0;
}

Point::Point(string xCord, string yCord) {
  if(validateString(xCord) && validateString(yCord)){
    x = stod(xCord);
    y = stod(yCord);
  }
}

Point::Point(double xCord , double yCord) {
	x = xCord;
	y = yCord;
}

void Point::setCords(double xCord, double yCord) {
	x = xCord;
	y = yCord;
}

double Point::getX() const {
	return x;
}

double Point::getY() const {
	return y;
}

void Point::displayPoint() {
	cout << "( " << x << " ; " << y << " )" << endl;
}

bool Point::operator==(const Point &a) {
	if ((x == a.getX()) && (y == a.getY())) return true;
	return false;
}

bool Point::operator!=(const Point &a) {
	if ((x != a.getX()) || (y != a.getY())) return true;
	return false;
}

bool operator==(Point &a, Point &b) {
	if ((a.getX() == b.getX()) && (a.getY() == b.getY())) return true;
	return false;
}

bool operator!=(Point &a, Point &b) {
	if ((a.getX() != b.getX()) || (a.getY() != b.getY())) return true;
	return false;
}

bool Point::validateString(string s){
  int i = 0;
  bool dot = false;
  if (s[0] == '-')
    i = 1;
  for (i; i < s.size(); i++){
    if(s[i] == '.') {
      if (dot)
        throw LPSInNumber(s);
      else{
        dot = true;
        continue;
      }
    }

    if (!isnumber(s[i]))
      throw LPSInNumber(s);
  }
  if (s.size() > 10)
    throw CordsTooBig(s);
  return true;
}