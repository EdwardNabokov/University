#include "helper.h"
#include <iostream>
using namespace std;

void fill(int value, Tree **Node) 
{
	if ((*Node == NULL))  //if the tree doesn't exist
	{
		(*Node) = new Tree; //allocate memory for new Node
		(*Node)->left = (*Node)->right = NULL; 
		(*Node)->number = value; //save value to the new-created node
	}
	else //if the tree created
	{
			fill(value, &(*Node)->left); 
			fill(value, &(*Node)->right); 
	}
}
void output(Tree *Node)
{
	if (Node == NULL)   
		return;    //if the tree doesn't exist - end

	cout << Node->number << endl; //output value of current node
	output(Node->left); //going through left subtree    
	output(Node->right); //going through right subtree   
}
