# zero_runtime
Zero Runtime is an important feature of the C language.
The bottom line is that the so-called Entry Point (main) in C is not 
the beginning of the program. The program starts with _start, and here is 
what happens after _start and before the start of main - there is C runtime. 
You can replace it, and thus work with microcontrollers and other processors. 
So you can only do with Assembler, and it is because of this that C is the 
only candidate for writing OS kernels.

# start.asm
In the start.asm file, there is code that runs before main, 
this code is as simple as possible, there is nothing there.

# calls.asm
The calls.asm file contains sys_write and sys_read, 
two self-written system calls that work directly
with linux and use interrupts.

# greet_3.c
'greet_3.c' contains the code for a simple application that writes 
"Hello, dear YOUR_NAME" where YOUR_NAME is the second argument passed 
to the command line. Actually, the code that processes this is in start.asm, 
as I said in C, there is nothing.

# Makefile
The Makefile contains a standard build. 
I create the object files start.o, calls.o, greet_3.o and 
executable greet_3 which I compile from object objects 
using ld, the link editor. Why? Because we no longer need the standard C library.

# LOG
The LOG file that I received with the strace utility 
contains a complete list of functions that are called while greet_3 is running.
As you can see there are only 5 of them.
Under standard conditions, there will be 29.

# source.
An example is taken from the book of 
A. V. Stolyarov: Programming. Introduction to the profession. 
Volume 2. Part 4. Programming in C. 
Chapter 16. Programming in C without a standard library (*).
