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
- Computer memory is used for a number of different things. Everything what a computer is, is all stored in computer memory. All of the following are comptuer data:
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


## Interpreting Memory


## Data Accessing Methods


## Review

### Know the Concepts

### Use the Concepts

### Going Further
