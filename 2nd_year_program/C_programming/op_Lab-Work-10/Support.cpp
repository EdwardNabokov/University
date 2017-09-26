#include "Support.h"
#include <iostream>
#include <ctime>
using namespace std;

void createList(Queue *List)
{
	List->first = new Node;
	List->first->next = NULL;
	List->last = List->first;
	List->size = 0;
	//for (int i = 'a'; i <= 'z'; i++)
	//{
	//	List->last->next = new Node;
	//	List->last = List->last->next;
	//	List->last->character = i; //add element to the end of queue
	//	List->last->next = NULL; //defined pointer to the null
	//	List->size++;
	//}
	do
	{
		List->last->next = new Node;
		List->last = List->last->next;
		List->last->character = '!' + rand() % 90;
		List->last->next = NULL;
		List->size++;
	} while(List->size < 20);
}
void addElement(Queue *List)
{
	char character;
	cout << "\nInput character: "; cin >> character;
	List->last->next = new Node;
	List->last = List->last->next;
	List->last->character = character; //add element to the end of queue
	List->last->next = NULL; //defined pointer to the null
	List->size++;
	cout << "\nElement added\n";
}
void deleteElement(Queue *List)
{
	if (List->first->next == NULL)
		cout << "\nQueue is empty\n";
	List->first = List->first->next;
	List->size--;
	cout << "\nElement deleted\n";
}
void FindChange(Queue *List)
{
	List->last = List->first;
	int max = (int)List->last->character;
	while (List->last->next != NULL)
	{
		List->last = List->last->next;
		if (List->last->character > max)
			max = List->last->character;
	}
	
	cout << "\nMax: " << (char)max << endl;
	cout << "Changed: " << List->first->next->character << " to " << (char)max << endl << endl;
	List->first->next->character = (char)max;
}
void outputElements(Queue *List)
{
	List->last = List->first;
	cout << "\nContent of queue: ";
	do
	{
		cout << List->last->next->character << " ";
		List->last = List->last->next;
	} while (List->last->next != NULL);
	cout << "\n\n";
}
bool isEmpty(Queue *List)
{
	if (List->first == List->last)
		return false;
	else
		return true;
}
