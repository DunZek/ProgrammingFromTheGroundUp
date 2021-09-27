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
- At the beginning there are lots of liens that begin with hashes `#`. These are *comments*.
- Get into the habit of writing commetns in your code that will help them understand both why the program exists and how it works. Always include the following in your commetns:
	- The purpose of the code
	- An overview of the processing involved
	- Anything strange your program does and why it does it
- You'll find that many programs end up doing strange things. Usually there is a reason for that, but unfortunately, programmers never documetn such things in their comments. So, future programmers either have to learn the reason by modifying and watching the code break, or just leaving it alone whether it is still needed or not. You should *always* documetn any strange behavior your program performs. Unfortuantely, figuring out what is strange and what is straightforward comes mostly with experience.
- After the comments, the next line says
	- `.section .data`
	- Anything starting with a period isn't directly translated into a machine instruction. Instead, it's an instruction to the assembler itself.
- These are called *assembler directives* or *pseudo-operations* because they are handled by the assembler and are not actually run by the computer
	- The `.section` command breaks your program into sections.
	- This command starts the data section, where you list any memory storage you will need for data.
		- `.section .data`
	- Our program doesn't use any, so we don't need the section. It's just here for compeleteness. Almost every program you write in the future will have data.
- Right after this you have
	- `.section .text`
	- which starts the text section. The text section of a program is where the program instructions live.
- The next instruction is
	- `.globl _start`
	- This instructs the assembler that `_start` is important to remember.
	- `_start` is a *symbol*, which means that it is going to be replaced by something else either during assembly or linking.
	- `.globl` means that the assembler shouldn't discard this symbol after assembly because the linker will need it.
	- `_start` is a special symbol that always needs to be marked with `.globl` because it marks the location of the start of the program.
	- *Without markign this location in this way, when the computer loads your program it won't know where to begin running your program.*
- Symbols are generally used to mark locations of programs or data, so you can refer to them by name instead of by their location number.
- Symbols are used so that the assembler and linker can take care of keeping track of addresses, and you can concentrate on writing your program.
- The next line
	- `_start:`
	- *defines* the value of the *_start* label. A *label* is a symbol followed by a colon. 
Labels define a symbol's value. They tell the assembler to make the symbol's value be wherever the next instruction or data element will be. This way, if the actual physical location of the data or instruction changes, you don't have to rewrite any references to it: the symbol automatically gets the new value.
- Now we get into actual computer instructions. The first such instruction is this:
	- `movl $1, %eax`
	- This instruction transfers the number `1` into the `%eax` register.
- In assembly language, many instructions have *operands*. 
	- `movl` has two operands: the *source* and the *destination*.
	- Operands can be numbers, memory location references, or registers.
	- See Appendix B for more information on which instructions take which kinds of operands.
- On x86 processors, there are several general-purpose registers (all of which can be used with `movl`):
	- `%eax`
	- `%ebx`
	- `%ecx`
	- `%edx`
	- `%edi`
	- `%esi`
- In addition to these general-purpose registers, there are also several special-purpose registers, including:
	- `%ebp`
	- `%esp`
	- `%eip`
	- `%eflags`
- Note that on x86 processors, even the general-purpose registers have some special purposes, or used to before it went 32-bit. 
	- However, these are general-purpose registers for most instructions. Each of them has at least one instruction where it is used in a special way. 
	- However, for most of them, those instructions aren't covered in this book.
- You may be wondering, *why do all of these registers begin with the letter e?* The reason is that early generations of x86 processors were 16 bits rather than 32 bits. 
	- Therefore, the registers were only half the length they are now. In later generations of x86 processors, the size of the registers doubled. They kept the old names to refer to the first half of the register and added an `e` to refer to the extended versions of the register. 
	- Usually you will only use the extended versions. Newer models also offer a 64-bit mode, which doubles the size of these registers yet again and uses an `r` prefix to indicate the larger registers (i.e. `%rax` is the 64-bit version of `%eax`). 
	- However, these processors are not widely used (2004), and are not covered in this book.
- So, the `movl` instructions moves the number `1` into `%eax`. The dollar-sign in front of the `1` indicates that we want to use immediate mode addressing. Without the dollar-sign, it would do direct addressing, loading whatever number is at address 1.
- The reason we are moving the number 1 into `%eax` is because we are preparing to call the Linux Kernel. The number `1` is the number of the `exit` *system call*.
	- Many operations such as calling other programs, dealing with files, and exiting have to be handled by the operating system through system calls.
	- When you make a system call, the system call number has to be loaded into `%eax` (for a complete listing of system calls and their numbers, see Appendix C).
- *Parameters* are extra data stored in other registers. 
	- In the case of the `exit` system call, the operating system requires a status code to be loaded in `%ebx`. This value is then returned to the system, and it is the value you retrieved when you typed `echo $?`.
	- So, we load `%ebx` with `0` by typing the following:
		- `movl $0, %ebx`
- Loading registers doesn't do anything by itself. Apart from system calls, registers are places where all program logic such as addition, subtraction, and comparisons take place. 
	- Linux simply requires that certain registers be loaded with certain parameter values before making a system call.
	- `%eax` is always required to be loaded with the system call number. 
	- For other registers however, each system call has different requirements.
		- In the `exit` system call, `%ebx` is required to be loaded with the exit status.
	- See Appendix C for a list of common system calls and what is required to be in each register.
- The next instruction is the "magic" one. It looks like this:
	- `int $0x80`
	- `int` stands for *interrupt*.
	- The `0x80` is the interrupt number to use.
	- You may be wondering why it's `0x80` instead of just `80`. The reason is that the number is written in hexadecimal. Numbers starting with `0x` are in hexadecimal. Tacking on an `H` at the end is also sometimes used instead. 
		- For more information about this, see Chapter 10.
- An *interrupt* interrupts the normal program flow, and transfers control from our program to Linux so that it will do a system call.
	- Actually, the interrupt transfers control to whoever set up an *interrupt handler* for the interrupt number. In the case of Linux, all of them are set to be handled by the Linux kernel.
- In this case, all we're doing is asking Linux to terminate the progam, in which case we won't be back in control. If we didn't signal the interrupt, then no system call would have been performed.

### Quick System Call Review: 
- To recap, the Operating System features are accessed through system calls.
- These are invoked by setting up the registers in a special way and issuing the instruction `int $0x80`.
- Linux knows which system call we want to access by what we stored in the `%eax` register. 
- Each system call has other requirements as to what needs to be stored in the other registers.
- System call number 1 is the `exit` system call, which requires the status code to be placed in `%ebx`.

## Planning the Program
- In our next program, we will try to find the biggest number from a list of numbers.
- Computers are very detail-oriented, so in order to write the program we will have to have planned out a number of details:
	- Where will the original list of numbers be stored?
	- What procedure will we need to follow to find the maximum number?
	- How much storage do we need to carry out that procedure?
	- Will all of the storage fit into registers, or do we need to use some memory as well?
- A computer needs a plan of every step of the way. So, let's do a little planning.
	- First of all, just for reference, let's name the address where the list of numbers starts as `data_items`.
	- Let's say that the last number in the list will be a zero, so we know where to stop.
	- We also need:
		- a value to hold the current position in the list
		- a value to hold the current list element being examined
		- the current highest value on the list
- Let's assign each of these a register:
	- `%edi` will hold the current position in the list.
	- `%ebx` will hold the current highest value in the list.
	- `%eax` will hold the current element being examined.
- When we begin the program and look at the first item in the list, since we haven't seen any other items, that item will automatically be the current largest element in the list. 
- Also, we will set the current position in the list to be zero; the first element. From then, we will execute the following steps:
	1. Check the current list element (`%eax`) to see if it's zero (the terminating element/sentinel value).
	2. If it is zero, exit
	3. Increase the current position (`%edi`)
	4. Load the next value in the list into the current value register (`%eax`).
		- What addressing mode might we use here? Why?
			- Register-addressing mode: containing a register to access and retrieve data from rather than a memory location.
			- Because we are loading the next value in the list, a list and its values which we have registered into a register, and so must be accessed using register-addressing mode.
	5. Compare the current value (`%eax`) with the current highest value (`%ebx`)
	6. If the current value is greater than the current highest value, replace the current highest value with the current value
	7. Repeat.
- These "if"s are a class of instructions called *flow control* instructions because they tell the computer which steps to follow and which paths to take. 
	- In the previous program, we did not have any flow control instructions, as there was only one possible path to take: `exit`.
	- This program is much more dynamic in that it is directed by data.
- Depending on what data this program receives, it will follow different instruction paths. This will be accomplished by two different instructions:
	- The conditional jump changes paths based on the results of a previous comparison or calculation.
	- The unconditional jump just goes directly to a different path no matter what.
- Another use of flow control is in implementing loops, which are pieces of program code that are repeated.
	- The first part of the program was only done once, so it wasn't a loop.	- However, the next part is repeated over and over again for every number in the list, terminating only when the sentinel value is encountered.
- Loops are implemented by doing unconditional jumps to the beginning of the loop at the end of the loop, which causes it to start over.
- Remember to always have a conditional jump to exit the loop somewhere or the loop will continue forever!
	- This condition is caled an *infinite loop*.
- In the next section, we will implement this program that we have planned. Program planning sounds complicated, and it is to some degree.
	- When you first start programming, it's often hard to convert our normal thought process into a procedure that the computer can understand.
	- We often forget the number of "temporary storage locations" that our minds are using to process problems.
- As you read and write programs, however, this will eventually become very natural to you. Just have patience.

## Finding a Maximum Value
- Initialize `maximum.s` with the code prepared in the book.
- Now, assemble and link it with these commands:
	- `as maximum.s -o maximum.o`
	- `ld maximum.o -o maximum`
- Now run it, anc check its status
	- `./maximum`
	- `echo $?`
- These lines are the data section:
	- ```assembly
	  data_items:	# These are the data items
			.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0 
	  ```
	- `.data_items` is a label that refers to the location that follows it.
	- Then, there is a directive that starts with `.long`, which causes the assembler to reserve memory for the list of numberes that follow it.
	- Because `data_items` is a label, any time in our program where we need to refer to this address we can use the `data_items` symbol, and the assembler will substitute it with the address where the numbers start during assembly.
- There are several different types of memory locations other than `.long` that can be reserved. The main ones are as follows:
	- `.byte`
		- Bytes take up one storage location for each number. They are limited to numbers between 0 and 255.
	- `.int`
		- Integers take up two storage locations for each number. These are limited to numbers between 0 and 65535.
	- `.long`
		- Longs take up four storage locations. This is the same amount of space the registers use, which is why they are used in this program. They can hold numbers between 0 and 4294967295.
	- `.ascii`
		- The `.ascii` directive is to enter in characters into memory. Characters each take up one storage location (they are converted into bytes internally). 
		- So, if you gave the directive. `.ascii "Hello there\0"`, the assembler would reserve 12 storage locations (byte). 
			- The first byte contains the numeric code for `H`, the second byte contains the numeric code for `e`, and so forth.
			- The last character is represented by `\0`, and it is the terminating character (it will never display, it just tells other parts of the program that it's the end of the characters).
		- Letters and numbers that start with a backslash represent characters that are not typeable on the keyboard or easily viewable on the screen. 
			- For example, `\n` refers to the "newline" character which causes the computer to start output on the next line.
			- `\t` refers to the "tab" character.
		- All of the letters in an `.ascii` directive should be in quotes.
- In our example, the assember reserves 14 `.long`'s one right after another. Since each long takes up 4 bytes, that means that the whole list takes up 56 bytes.
	- `.data_items` is used by the assembler to refer to the address of the first of these values.
- Take note that the last data item in the list is a zero. I decided to use a zero to tell my program that it has hit the end of the list.
	- No matter how I do it, I must have some method of determining the end of the ist. The computer knows nothing: it can only do what it is told.
	- It's not going to stop processing unless I give it some sort of signal.
	- Otherwise, it would continue processing past the end of the list into the data that follows it, and even to locations where we haven't put any data.
- Notice that we don't have a `.global` declaration for `data_items`. This is because we only refer to these locations within the program.
	- No other file or program needs to know where they are located.
	- This is in contrast to the _start symbol, which Linux needs to know where it is so that it knows where to begin the program's execution.
- In the comments you will notice that we've marked some *variables* that we plan to use. A variable is a dedicated storage location used for a specific purpose, usually given a distinct name by the programmer. In this program, we have several variables:
	- a variable for the current maximum number found
	- a variable for which number of the list we are currently examining, called the *index*
	- a variable holding the current number being examined
- In this case, we have few enough variables that we can hold them all in registers. In larger programs, you have to put them in memory, and then move them to registers when you are ready to use them.
	- In this program, we are using `%ebx` as the location of the largest item we've found.
	- `%edi` is used as the *index* to the current data item we're looking at.
- Now, let's talk about what an index. The data item number is the *index* of `data_items`. You'll notice that the first instruction we give to the computer is:
	- `movl $0, %edi`
- Now, the next instruction is tricky, but crucial to what we're doing. It says:
	- `movl data_items(,%edi,4), %eax`
	- Now to understand this line, you need to keep several things in mind:
		- `data_items` is the location number of the start of our number list.
		- Each number is stored across 4 storage locations (because we declared it using `.long`)
		- `%edi` is holding 0 at this point
	- So, basically what this line says is:
		1. start at the beginning of `data_items`
		2. take the first item number (because `%edi` is 0)
		3. remember that each number takes up four storage locations
	- Then it stores that number in `%eax`
- This is how you write indexed addressing mode instructions in assembly language. The instruction in a general form is this:
	`movl BEGINNINGADDRESS(,%INDEXREGISTER,WORDSIZE)`
	- In our case:
		- `data_items` was our beginning address
		- `%edi` was our index register
		- 4 was our word size
	- This topic is discussed further in the Section called *Addressing Modes*.
	- Very strange things would happen if we used a number other than 4 as the size of our storage locations.
		- It's actually what's called a *multiplier*. Basically, the way it works is that you start at the location specified by `data_items`, then you add `%edi` * 4 storage locations, and retrieve the number there.
		- Usually, you use the size of the numbers as your multiplier, but in some circumstances you'll want to do other things.
- Let's look at the next line:
	- `movl %eax, %ebx`
	- We have the first item stored in `%eax`. As the first item, it's the biggest so far.
	- We store it in `%ebx`, since that's where we are keeping the largest number we found.
	- Also, even though `movl` stands for *move*, it actualyl copies the values, so `%eax` and `5ebx` both contain the starting value.
		- The `l` in `movl` stands for `move long` since we are moving a value that takes up four storage locations.
- We have marked the starting location of the loop in the symbol `start_loop`. We have a single section of code (a loop) that we execute over and over again for every element in `data_items`.
- Then we have these instructions:
	- ```assembly
	  cmpl $9, %eax
	  je end_loop		
	  ```
	- The `cmpl` instruction compares the two values. This compare instruction affects a register not mentioned here, the `%eflags` register, also known as the status register.
	- The next line is a flow control instruction which says to *jump* to the `end_loop` location if the values that were just compared to are equal (that's what the `e` of `je` means).
		- It uses the status register to hold the value of the last comparison.
- We used `je`, but there are many jump statements that you can use:
	- `je` - Jump if the values were equal
	- `jg` - Jump if the second value was greater than the first value
	- `jge` - Jump if the second value was greater than or equal to the first value
	- `jl` - Jump if the second value was less than the first value
	- `jle` Jump if the second value was less than or equal to the first value
	- `jmp` - Jump no matter what. This does not need to be preceeded by a comparison.
	- The complete list is documented in Appendix B.
- The names of these symbols can be anything you want them to be, as long as they only contain letters and the underscore character (_).
	- The only one that is forced is _start, and possibly others that you declare with `.global`.
- If the last loaded element was not zero, we go on to the next instructions:
	- ```assembly
	  incl %edi
	  movl data_items(,%edi,4), %eax
	  ```
	- `incl` increments the value of `%edi` by one.
	- Then the `movl` is just like the one we did beforehand.
- Now `%eax` has the next value to be tested. So, let's test!
	- ```assembly
	  cmpl %ebx, %eax
	  jle start_loop
	  ```
- Otherwise, we need to record that value as the largest one:
	- ```assembly
	  movl %eax, %ebx
	  jmp start_loop
	  ```
- The exit call requires that we put our exit status in `%ebx`.

## Addressing Modes

## Review

### Know the Concepts

### Use the Concepts

### Going Further

