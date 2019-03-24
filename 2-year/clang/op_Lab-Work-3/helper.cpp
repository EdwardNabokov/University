#include "helper.h"
#include "Exception.h"

using namespace std;

void display_info() {
	cout << setfill('"') << setw(10) << '"' << endl;
	cout << "Edward Nabokov" << endl;
	cout << "V - 10" << endl;
	cout << "Level: B" << endl;
	cout << setfill('"') << setw(10) << '"' << endl;
}

int display_menu() {
	int answer;
	while (true) {
		cout << setfill('-') << setw(40) << '-' << endl;
		cout << "1 -> Add point to 1 set" << endl;
		cout << "2 -> Add point to 2 set" << endl;
		cout << "3 -> Remove point from 1 set" << endl;
		cout << "4 -> Remove point from 2 set" << endl;
		cout << "5 -> Actions" << endl;
		cout << "6 -> Exit" << endl;
		cout << setfill('-') << setw(40) << '-' << endl << endl;
		answer = getNumber(6);
        return answer;
	}
}

Points test_set1() {
	Points arr;
	Point test1(-1, -1), test2(3.25, 6.44), test3(-4, 5), test4(-1, -4), test5(-100, 100);
	arr << test1;
	arr << test2;
	arr << test3;
	arr << test4;
	arr << test5;
	return arr;
}

Points test_set2() {
	Points arr;
	Point test1(-1, -1), test2(4, 13), test3(5, 23), test4(0, 0), test5(-100, 100);

	arr << test1;
	arr << test2;
	arr << test3;
	arr << test4;
	arr << test5;

	return arr;
}

void add_point(Points &arr) {
	string x, y;
	while (true)
	{
		try {
          cout << "Input X: ";
          cin >> x;
          cout << "Input Y: ";
          cin >> y;
          arr << Point(x, y);
        }
      catch (Exception &ex){
        ex.ExceptionHandler();
        continue;
      }
      catch (...){
        cout << "Incorrect coordinates!" << endl;
        continue;
      }
      break;
	}
}

void remove_point(Points &arr) {
	string x, y;
  while (true) {
    try {
      cout << "Input X: ";
      cin >> x;
      cout << "Input Y: ";
      cin >> y;
      arr >> Point(x, y);
    }
    catch (Exception &ex) {
      ex.ExceptionHandler();
      continue;
    }
    catch (...) {
      cout << "Incorrect dot" << endl;
      continue;
    }
    break;
  }
}

void make_action(Points &arr1, Points &arr2) {

	cout << endl;
	cout << "1 -> Union (+ operator)" << endl;
	cout << "2 -> Intersection (* operator)" << endl;
	cout << "3 -> Difference (- operator)" << endl;

	int answer = getNumber(3);
	Points temp;
	switch (answer) {
	case 1: {
		temp = arr1 + arr2;
		cout << endl;
		cout << "RESULT:" << endl;
		temp.displayArrayPoints();
		cout << endl;
		break;
	}
	case 2: {
		temp = arr1 * arr2;
		cout << endl;
		cout << "RESULT:" << endl;
		temp.displayArrayPoints();
		cout << endl;
		break;
	}
	case 3: {
		temp = arr1 - arr2;
		cout << endl;
		cout << "RESULT:" << endl;
		temp.displayArrayPoints();
		cout << endl;
		break;
	}
	default:
		break;
	}
}

void work_logic(int answer, Points &arr1, Points &arr2) {
	switch (answer) {
	case 1: {
		add_point(arr1);
		break;
	}
	case 2: {
		add_point(arr2);
		break;
	}
	case 3: {
		remove_point(arr1);
		break;
	}
	case 4: {
		remove_point(arr2);
		break;
	}
	case 5: {
		make_action(arr1, arr2);
		break;
	}
	default:
		break;
	}
	cout << "Set 1:" << endl;
	arr1.displayArrayPoints();
	cout << endl;
	cout << "Set 2:" << endl;
	arr2.displayArrayPoints();
	cout << endl;
}

bool is_number(const std::string &s) {
  for (int i = 0; i < s.size(); i++)
    if (isalpha(s[i]) || (ispunct(s[i]) && i != 0))
      return false;
  try {
    atoi(s.c_str());
  }
  catch (...) {
    return false;
  }
  return true;
}

int getNumber(int bound) {
  string n;
  while (true) {
    cout << "Input: ";
    cin >> n;
    if (!is_number(n) || (atoi(n.c_str()) <= 0 || atoi(n.c_str()) > bound)) {
      cout << "Incorrect input" << endl;
    } else return atoi(n.c_str());
  }
}