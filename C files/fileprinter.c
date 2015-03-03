#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#define MAX_LENGTH 250
void touppercase(char *l);

int main(int argc, char *argv[]) 
{
	if (argc != 2) {
		fprintf(stderr, "ERROR!");
		return 1;
	}

	FILE *fp = fopen(argv[1], "r");
	char line[250];
	int counter = 0;
	printf("%s\n", argv[1]);
	while (fgets(line, 250, fp) != 0) {
		if (strlen(line) >= 100) {
			touppercase(line);
			printf("%s", line);
		}
		counter++;
	}
	printf("%d\n", counter);
	return 0;
}

void touppercase(char *l)
{
	int x = strlen(l);
	char copy[x];
	strncpy(copy, l, x);
	for (int i=0; i < x; i++) {
		copy[i] = toupper(copy[i]);
	}
	printf("%s", copy);
}
	
