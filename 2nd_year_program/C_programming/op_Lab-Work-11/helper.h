#pragma once
struct Tree
{
	Tree *left, *right; //pointer to the left subtree and the right as well
	int number; //data
};
void fill(int, Tree **); //fill with values
void output(Tree *); //show the content of tree using direct search