# gas-ascii-sum
A simple program coded in GNU Assembler that sums the ASCII values of the given input as command line arguments

The assem function is programmed using the GNU Assember, using AT&T syntax, and designed for x86_64 systems running the Linux kernel.
Use of the function in any system will most likely not work and is at your discretion.

## Compiling
A Makefile is included to make compiling easier. Running ```make``` in the project root will create the project and leave the executable, ```asciisum``` in the root, and move any artifacts into the ```bin``` folder

In the ```src``` folder:
- main.c - Programmed in C language, uses extern to reference the assembly function ```assem```
- assem.S - Programmed in GAS, used to find sum of 2D arrays


## Sample example
In terminal: ```./asciisum 1 2 3 4 5```

Stdout:
```c
String                  ASCII Value
----------------------------------------------------
1                       49
2                       50
3                       51
4                       52
5                       53
----------------------------------------------------
Sum                     255
```
Under the string column will hold argv values separated by spaces\
Under the ASCII Value column will hold the ASCII sum of the corresponding string\
The Sum will be the sum of the ASCII values from the entirety of the output

***Note only the Sum row utilizes the assem() GAS function***
