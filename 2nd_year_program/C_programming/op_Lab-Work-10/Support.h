#pragma once
struct Node
{
	char character;
	Node *next;
};
struct Queue
{
	int size;
	Node *first;
	Node *last;
};
void createList(Queue *); //creation of the initial queue
void addElement(Queue *); //addition of element to the end of queue
void deleteElement(Queue *); //deletion of the initial element of queue
void outputElements(Queue *); //display of the current queue
void FindChange(Queue *); //find max element and replace found to the initial
bool isEmpty(Queue *); //content verification 
