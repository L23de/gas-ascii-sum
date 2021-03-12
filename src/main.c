#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int assem(int*, char**);

// Finds the sum of the ASCII values composed in string
int printASCII(char* string) {
    int adder = 0;
    for (int i = 0; i < strlen(string); i++) {
        int charVal = string[i];
        adder += charVal;
    }
    return adder;
}

int main(int argc, char** argv) {
    if (argc == 1) {
        fprintf(stdout, "No input detected. Re-run with value as cmd-line args");
    }

    fprintf(stdout, "String\t\t\tASCII Value\n");
    fprintf(stdout, "----------------------------------------------------\n");

    for (int i = 1; i < argc; i++) {
        fprintf(stdout, "%-10s\t\t", argv[i]);
        fprintf(stdout, "%-10d\n", printASCII(argv[i]));
    }

    fprintf(stdout, "----------------------------------------------------\n");
    fprintf(stdout, "Sum\t\t\t%-d\n", assem(&argc, argv));
}