asciisum: assem.o main.o
	gcc -o asciisum main.o assem.o

main.o: main.c
	gcc -c main.c

assem.o: assem.S
	as -o assem.o assem.S

clean:
	rm -f *.o asciisum