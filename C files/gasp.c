// William Thing
// CSE374 HW4
// Feb 3, 2015
//
// This program's purpose is to find matching string
// in given file(s), printing the file name and
// the matching line.
//
// The program gives two options passed as arguments:
//
// -i ignores all casing of the given word
// and lines printing the original line found.
//
// -n will print the line number from which it is 
// found in the given file.

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define lineCount 500
#define maxCount 100 // assume matching string is not over 100 chars

int booleanI; // if 1 is true; 
int booleanN; // if 1 is true;

int matchstr(char* line, char* matchstring);
int grepFile(char* argv[], int i);

// Takes in a given string and file(s) with two optional arguments
// keeping track of -i and or -n options. Prints all lines
// matching given string in every file given.
// If there is less than two arguments given will print an
// error message and exit.
int main(int argc, char *argv[]) 
{
	if (argc < 3) {
		fprintf(stderr, "Not enough arguments\n");
		exit(1);
	} 
	if (strcmp(argv[1], "-i") == 0 || strcmp(argv[2], "-i") == 0) {
		booleanI = 1;
	}
	if (strcmp(argv[1], "-n") == 0 || strcmp(argv[2], "-n") == 0) {
		booleanN = 1;
	}
	for (int i = booleanN + booleanI + 2; i < argc; i++) {
		grepFile(argv, i);		
	}			
	return 0;	
}

// Return 1 if the two strings match ignoring casing.
// otherwise 0 for they do not match.
int matchstr(char* line, char* matchstring) 
{
	int len1 = strlen(line);
	int len2 = strlen(matchstring);
	char* str1 = (char*) malloc(len1*sizeof(char));
	char* str2 = (char*) malloc(len2*sizeof(char));
	for (int i = 0; i < len1; i++) {
		str1[i] = tolower(line[i]);
	}
	for (int k = 0; k < len2; k++) {
		str2[k] = tolower(matchstring[k]);
	}
	int casematch = 0; // for does not match
	if (strstr(str1, str2)) {
		casematch = 1; // if enters statement match is found
	}
	free(str1);
	free(str2);
	return casematch;					
}

// Takes in given file(s) and index to print the file name of
// matching string and the lines found. If -i and/or -n
// options will print matches ignoring cases and/or print line
// count found in file.
// if file does not exist, prints error message at specific file and 
// continues printing found matching string.
// lineCount is defined as the max char in a given line.
int grepFile(char* argv[], int i)
{
	FILE* file = fopen(argv[i], "r");
	if (file == NULL) {
		fprintf(stderr, "%s does not exist\n", argv[i]);
		return 1;		
	}
	char line[lineCount];
	int lineCounter = 0;
	while (fgets(line, lineCount, file)) {
		char* word = NULL;
		int match = 0;
		if (booleanI == 1) {
			match = matchstr(line, argv[booleanN+booleanI+1]);
		} else {
			word = strstr(line, argv[booleanN+booleanI+1]);
		}
		lineCounter++;
		if (word!=NULL || match!=0) {
			if (booleanN == 1) {
				printf("%s:%d:%s", argv[i], lineCounter, line);
			} else {
				printf("%s:%s", argv[i], line);
			}
		}
	}
	fclose(file);	// safetly closes file
	return 0;
}
