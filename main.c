#include <stdio.h>
#include <stdlib.h>

extern int assem(int*, char**);

int main(int argc, char** argv) {
    fprintf(stdout, "String\t\t\t\tASCII Value");
    fprintf(stdout, "----------------------------------------------------------------------");

    for (int i = 0; i < argc; i++) {
        fprintf(stdout, "%s\t\t\t", argv[i]);
        fprintf(stdout, "%d\n", atoi(argv[i]));
    }
    fprintf(stdout, "----------------------------------------------------------------------");
    fprintf(stdout, "%d", assem(&argc, argv));
}