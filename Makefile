asciisum: assem.o main.o
	mkdir -p bin
	gcc -o asciisum main.o assem.o
	mv main.o bin/main.o
	mv assem.o bin/assem.o

main.o:
	gcc -c src/main.c

assem.o:
	as -o assem.o src/assem.S

clean:
	rm -f *.o asciisum 
	rm -rf bin