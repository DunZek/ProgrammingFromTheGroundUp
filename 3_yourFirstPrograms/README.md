# Chapter 3. Your First Programs

- In this chapter, you will learn the process for writing and building Linux assembly-language programs.
- In addition, you will learn the structure of assembly-language programs, and a few assembly-language commands.
- As you go through this chapter, you may want to refer also to Appendix B and Appendix F
- These programs may overwhelm you at first. However, go through them with diligence, read them and their explanations as many times as necessary, and you will have a solid foundation of knowledge to build on. Please tinker around with the programs as much as you can. Even if your tinkering does not work, every failure will help you learn.

## Entering in the Program
- Okay, this first program is simple. In fact, it's not going to do anything but exit! It's short, but it shows some basics about assembly language and Linux programming.
- You need to enter the program in an editor exactly as written, with the filename `exit.s`
- In the Section called *Outline of an Assembly Language Program* we will describe how it works.
- What you have typed in is called the *source code*. Source code is the human-readable form of a program.
- In order to transform it into a program that a computer can run, we need to *assemble* and *link* it.
- The first step is to *assemble* it. Assembling is the process that transforms what you typed into instructions for the machine.
- An *assembly language* is a more human-readable form of the instructions a computer understands. Assembling transforms the human-readable file into a machine-readable one.
- To assemble the program type in the command
	- `as exit.s -o exit.o`
	- `as` is the command which runs the assembler
	- `exit.s` is the source file
	- `-o exit.o` tells the assembler to put its output in the file `exit.o`
	- `exit.o` is an *object file*. An object file is code that is in the machine's language, but has not been completely put together.
- In most large programs, you will have several source files, and you will convert each one into an object file.
- The *linker* is the program that is responsible for putting the object files together and adding information to it so that the kernel knows how to load and run it.
	- In our case, we only have one object file, so the linker is only adding the information to enable it to run.
- To *link* the file, enter the command.
	- `ld exit.o -o exit`
		- `ld` is the command to run the linker
		- `exit.o` is the object file we want to link
		- `-o exit` instructs the linker to output the new program into a file called `exit`
- If any of these commands reported errors, you have either mistyped your program or the command.
- *You must always re-assemble and re-link programs after you modify the source file for the changes to occur in the program.*
- You can run `exit` by typing in the command
	- `./exit`
- You'll notice when you type this command, the only thing that happens is that you'll go to the next line. That's because this program does nothing but exit. 
- However immediately after you run the program, if you type in
	- `echo $?`
	- It will say `0`.
	- What is happening is that every program when it exits gives Linux an *exit status code*, which tells it if everything went all right. If everything was okay, it returns 0.
- UNIX programs return numbers other than zero to indicate failure or other errors, warnings, or statuses. 
- The programmer determins what each number means.

## Outline of an Assembly Language Program
