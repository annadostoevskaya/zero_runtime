CC = gcc
ASM = nasm
LD = ld

DEBUG = -g
FLAGS_CC = -Wall -c
FLAGS_ASM = -f elf

TARGET = greet_3

all: start.o calls.o greet_3.o greet_3


greet_3.o: greet_3.c
	$(CC) greet_3.c -o greet_3.o $(FLAGS_CC) $(DEBUG)

calls.o: calls.asm
	$(ASM) $(FLAGS_ASM) $(DEBUG) calls.asm -o calls.o

start.o: start.asm
	$(ASM) $(FLAGS_ASM) $(DEBUG) start.asm -o start.o

greet_3: greet_3.o calls.o start.o
	$(LD) start.o calls.o greet_3.o -o $(TARGET)

clean:
	rm -f ./*.o
	rm -f ./greet_3

run:
	./greet_3 "Annd Dostoevskaya"
