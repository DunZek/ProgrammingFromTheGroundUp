# Chapter 2. Computer Architecture

- You need to understand the basics of how a computer interprets programs.
- Modern computer architecture is based off of the Von Neumann architecture.
- The Von Neumann architecture divides the computer into two main parts:
	- CPU
	- Memory

## Structure of Computer Memory
- Computer memory is analagous to the PO boxes of the local post office:
	- a fixed number of PO boxes
	- each PO box contains value
- Computer memory is used for a number of different things. Everything what a computer is, is all stored in computer memory. All of the following are computer data:
	- Graphics
	- Pixel location
	- Mathematical calculations
	- Object state
	- Computer programs

## The CPU
- While the memory stores data, keeping track of reality, the CPU is the phenomenon or entity that uses that data.
- The CPU reads in instructions from memory one at a time and executes them. This is the *Fetch-execute cycle*.
- The CPU contains the following elements to accomplish this:
	- Program Counter
		- The *program counter* is used to tell the computer where to fetch the next instruction from by holding the memory address of the next instruction to be executed.
		- The CPU uses the program counter to retrieve the instruction number stored in memory, passing it to the *instruction decoder*
	- Instruction Decoder
		- Used by the CPU to figure out what the given instruction, whose givenness is defined by the program counter, means.
		- Determines arithmetic processes and desired memory locations.
		- Computer instructions usually also consist of a list of memory locations, determining where they are carried out.
	- Data bus
		- The actual physical connection between the CPU and memory.
		- Used by the CPU to fetch memoery locations to be used in the calculation.
	- Registers
		- High-speed memory locations embedded within the processor itself.
		- Most information is stored in main memory, brought in to the registers for processing, and then put back into memory when the processing is completed.
		- General-purpose registers -> locations of arithmetic and primary processing operations.
		- Special-purpose registers -> (*discussed later*)
	- Arithmetic and logic unit (ALU)
		- Data and decoded instructions are passed to the *arithmetic and logic unit* for further processing, where instructions are actually executed.
		- Results of computation are returned to their appropriate location in memory or in a register via data bus, as specified by instruction.
- Although the basic operation is still the same, it is complicated by the use of cache hierarchies, supercalar processors, pipelining, branch prediction, out-of-order execution, microcode translation, coprocessors, and other optimizations.

## Some Terms
- Computer memory is a numbered sequence of fixed-size storage locations. 
- The *address* is the number attached to each storage location.
- The size of a single storage location is called a *byte*.
	- On x86 processors, a byte is a number between 0 and 255.
- Specialized hardware have special interpretations of these numbers, ranging from 0 to 255, stored in the computer's memory. These specialized hardwares are what give rise to computer graphics, audio, and various side-effects.
- The list of ASCII characters and their numeric codes is found in Appendix D.
- In addition to using numbers to represent ASCII characters, you as the programmer get to make the numbers mean anything you want them to, as well.
- So what about if we need numbers larger than 255? We can simply use a combination of bytes to represent larger numbers.
- Four-byte numbers are what we will work with by default.
- Registers are what the computer uses for computation. Registers keep the contents of numbers that you are currently manipulating.
- The size of a typical register is called a computer's *word size*. x86 processors have four-byte words. This gives us roughly 4 billion values to.
- Addresses are also four bytes (1 word) long, and therefore also fit into a register.
- Notice that this means that we can store addresses the same way we store any other number. In fact, the computer can't tell the difference between a value that is an address and a value that is used for another purpose. 
- Numbers become addresses when they are used to locate the bytes they point to. **Take a moment to think about this because it is crucial to understanding how computer programs work.**
- Addresses which are stored in memory are also called *pointers* because instead of having a regular value in them, they point you to a different location in memory.
- The only way the computer knows that a memory location is an instruction is that a special-purpose register called the instruction pointer points to them at one point or another.
- Note that here we are talking about general computer theory. Some processors and operating systems actually mark the regions of memory that can be executed with a special marker that indicates this.

## Interpreting Memory
- Computers are very exact. Because they are exact, programmers have to be equally exact. A computer has no idea what your program is supposed to do. Therefore, it will only do exactly what you tell it to do. 
- Therefore, as a programmer, you need to know exactly how you have your data arranged in memory.
- Letters, pictures, music, web pages, documents, and anything else are just long sequences of numbers in the computer, which particular programs know how to interpret.
- Variable-length data is usually stored separately from the rest. If the length of data is variable, we will have a very hard time identifying the next location of data. Therefore, the length of almost all data is fixed.

## Data Accessing Methods
- Processors have a number of different ways of accessing data, known as addressing modes:
	- The simplest mode is *immediate mode*, in which the data to access is embedded in the instruction itself. 
		- For example, we can immediately specify a register to initialize with the value 0 instead of having to read 0 from memory.
	- In the *register addressing mode*, the instruction contains a register to access, rather than a memory location.
- The rest of the modes will deal now with addresses:
	- In the *direct addressing mode*, the instruction contains the memory address to access.
		- For example, we can load a register with the data at a particular address we specify, copying the memory-contents from the memory-location 
into the register.
	- In the *indexed addressing mode*, the instruction contains a memory address to access, and also specifies an *index register* to offset that address.
		- For example, we could specify address 2002 and an index register. If the index register contains the number 4, the actual address the data is loaded from would be 2006. 
		- This way, if you have a set of numbers starting at location 2002, you can cycle between each of them using an index register.
		- On x86 processors, you can also specify a *multiplier* for the index.
		- Take the time to calculate these yourself to make sure you understand how it works.
	- In the *indirect addressing mode*, the instruction contains a regster that contains a pointer to where the data should be accessed.
		- In direct addresing, we would just load the value directly specified with the register, but in indirect addressing, we use pointer values as the address to use to load the specified data we want in the memory to the register.
	- Finally, there is the *base pointer addressing mode*. This is similar to indirect addressing, but you also include a number called the *offset* to add to the register's value before using it for look up.
- There are other forms of addressing, but these are the most important ones.

## Review

### Know the Concepts
- Describe the fetch-execute cycle.
	- This is how the CPU works. The CPU iteratively executes instructions, receives more from memory as its instructions dictate, and keeps executing more.
- What is a register? How would computation be more difficult without registers?
	- Registers are the Random Access Memories of CPUs. They are tools the CPU uses to keep track of and execute actual instruction. 
	- Assuming without registers, the CPU will have to access the non-volatile memory over and over again via data buses, for they have become the means to store instructions instead of the registers. This method results in very slow computation.
- How do you represent numbers larger than 255?
	- We can simply use a combination of bytes to represent larger numbers.
- How big are the registers on the machines that we will be using?
	- The size of a register is called the word size, and on x86 processors, they are 4 bytes big, and can therefore deal with values roughly 4 billion in size.
- How does a computer know how to interpret a given byte or set of bytes of memory?
	- The CPU interprets instructions from memory and executes them using a special-purpose register called an instruction pointer that points numbers to those locations, becoming addresses due to their purpose. That's it. Otherwise, the computer's various specialized hardware such as the monitor and speakers and various software programs interpret these bytes according to their needs.
- What are the addressing modes and what are they used for?
	- Addressing modes are the different ways a processor accesses data. There are various addressing modes, but the listed below are the most important ones to consider:
		- Ways of accessing data within the processor:
			- Immediate mode, in which the data to access is embedded in the instruction itself. The processor can therefore specify a particular value to a register using this addressing mode.
			- Register addressing mode, in which the given instruction contains a register to access instead of a memory location.
		- Ways of accessing data outside the processor (via addresses):
		- Direct addressing mode, in which the instruction contains the memory address to access. Registers are able to use a given address to retrieve and use the value stored in the particular memory location.
		- Indexed addressing mode, in which the instruction contains the memory address to access, and also an index register to specify and that offsets that address.
		- Indirect addressing mode, in which the instruction contains a register that contains a pointer to where the data should be accessed. This means that the given register uses a pointer address to a particular memory location, and then the numerical value itself retrieved from the memory would be used as the actual address to the location we want in memory (thus becoming an address due to purpose).
		- Base pointer addressing mode, which is the index-addressing mode of indirect-addressing mode.
- What does the instruction pointer do?
	- The instruction pointer is a special-purpose register that the computer uses to interpret particular given memory locations contain instruction. he instruction pointer points to those memory locations at one point in time or another. So, if the instruction pointer points to a memory word, its contents are loaded as an instruction. It is the only way a computer can differentiate between programs and other types of data.

### Use the Concepts
- What data would you use in an employee record? How would you lay it out in memory?
	- As a computer, I would use numerical data to represent everything, only using programs to interpret some parts as strings of characters, such as the names of employees, and others as floating-point values, such as their weight.
	- As a computer, I will use fixed-sized 


### Going Further
