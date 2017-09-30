#pragma once
struct TBirthday
{
	unsigned short day, month, year;
};
struct TMarks
{
	short Math;
	short DS;
	short Program;
};
struct TStudent
{
	unsigned short key;
	char surname[20];
	char name[20];
	TBirthday birth;
	char initial;
	TMarks marks;
};