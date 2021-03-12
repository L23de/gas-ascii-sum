#include <stdio.h>
#include <stdlib.h>

extern int asciisum(int*, char**);

int main(int argc, char** argv) {
    printf("String\t\t\t\tASCII Value");
    printf("----------------------------------------------------------------------");

    for (int i = 0; i < argc; i++) {
        fprintf("%s\t\t\t", argv[i]);
        fprintf("%d\n", atoi(argv[i]));
    }
    printf("----------------------------------------------------------------------");
    fprintf(stdout, "%d", asciisum(&argc, argv));
}