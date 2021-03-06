# Chapter 2. Computer Architecture
> You need to understand the basics of how a computer interprets programs.

Modern computer architecture is based off of the *Von Neumann architecture*.

The Von Neumann architecture divides the computer into two main parts:
- The CPU.
- Memory.

## Structure of Computer Memory
> Computer memory is analagous to the PO boxes of the local post office:
- There are a fixed number of addressed PO boxes.
- Each PO box contains some value.

Computer memory is used for a number of different things. In fact, everything what a computer is, is all stored in computer memory. 

All of the following are kinds of computer data:
- Graphics.
- Pixel location.
- Mathematical calculations.
- Object/Data state.
- Computer programs.
- User data.

## The CPU
> While the memory stores data, keeping track of the computer's state in reality, the CPU is the phenomenon or a sort of entity that accesses and modifies all of that data under its will (which we program and give).

The CPU reads-in instructions from memory one at a time and executes them. This is called the *Fetch-execute cycle*.

The CPU contains the following five elements to accomplish this:

### Program Counter
> Sometimes referred to as the *instruction pointer*, is a register used to tell the CPU where to fetch the next instruction by holding the memory address of the next instruction to be executed.

The CPU uses the program counter to retrieve the instruction number (?) stored in memory, passing it to the *instruction decoder*.

### Instruction Decoder
> Used by the CPU to figure out what the given instruction, whose givenness (?) is defined by the program counter, means.

- Determines arithmetic processes and desired memory locations.

Computer instructions usually also consist of a list of memory locations, determining where they are carried out.

### Data buses
> The actual physical connection between the CPU and memory, and throughout many other electronical pieces in the computer.

Data buses are used by the CPU to fetch memory locations used in calculations.

### Registers
> High-speed memory locations embedded within the processor itself.

Most information is stored in *main memory*, brought in to the registers for processing, and then put back into memory when the processing is completed.

There are two types:
- *General-purpose registers* are locations of arithmetic and primary processing operations.
- *Special-purpose registers* are (*discussed later*).

### Arithmetic and logic unit (ALU)
> Data and decoded instructions are passed to the *arithmetic and logic unit* for further processing, where instructions are actually executed.

Results of computation are returned to their appropriate location in memory or in a register via data bus, as specified by instruction.

!!!TODO the rest!!!

- Although the basic operation is still the same, it is complicated by the use of cache hierarchies, supercalar processors, pipelining, branch prediction, out-of-order execution, microcode translation, coprocessors, and other optimizations.

## Some Terms

### Memory
- Computer memory is a numbered sequence of fixed-size storage locations. 
- The *address* is the number attached to each storage location.
- The size of a single storage location is called a *byte*.
	- On x86 processors, a byte is a number between 0 and 255.

### Byte interpretation
- Specialized hardware have special interpretations of these numbers, ranging from 0 to 255, stored in the computer's memory. These specialized hardwares are what give rise to computer graphics, audio, and various side-effects.
- The list of ASCII characters and their numeric codes is found in Appendix D.
- In addition to using numbers to represent ASCII characters, you as the programmer get to make the numbers mean anything you want them to, as well.

### Number size
- So what about if we need numbers larger than 255? We can simply use a combination of bytes to represent larger numbers.
- Four-byte numbers are what we will work with by default.

### Processor registers
- Registers are what the computer uses for computation. Registers keep the contents of numbers that you are currently manipulating.
- The size of a typical register is called a computer's *word size*. x86 processors have four-byte words. This gives us roughly 4 billion values to work with.

### Memory addresses
- Addresses are also four bytes (1 word) long, and therefore also fit into a register.
- Notice that this means that we can store addresses the same way we store any other number. In fact, the computer can't tell the difference between a value that is an address and a value that is used for another purpose. 
- Numbers become addresses when they are used to locate the bytes they point to. 
	- **Take a moment to think about this because it is crucial to understanding how computer programs work**

### Pointers
- Addresses which are stored in memory are also called *pointers* because instead of having a regular value in them, they point you to a different location in memory.
- The only way the computer knows that a memory location is an instruction is that a special-purpose register called the *instruction pointer* points to them at one point or another.
- Note that here we are talking about general computer theory. Some processors and operating systems actually mark the regions of memory that can be executed with a special marker that indicates this.

## Interpreting Memory
- Computers are very exact. Because they are exact, programmers have to be equally exact. A computer has no idea what your program is supposed to do. Therefore, it will only do exactly what you tell it to do. 
- Therefore, as a programmer, you need to know exactly how you have your data arranged in memory.
- Letters, pictures, music, web pages, documents, and anything else are just long sequences of numbers in the computer, which particular programs know how to interpret.
- *Variable-length* data is usually stored separately from the rest. If the length of data is variable, we will have a very hard time identifying the next location of data. Therefore, the length of almost all data is fixed.

## Data Accessing Methods

### Addressing modes
- Processors have a number of different ways of accessing data, known as addressing modes:
	- The simplest mode is *immediate mode*, in which the data to access is embedded in the instruction itself. 
		- For example, we can immediately specify a register to initialize with the value 0 instead of having to read 0 from memory.
	- In the *register addressing mode*, the instruction contains a register to access, rather than a memory location.

### Addressing modes
- The rest of the modes will deal now with addresses:
#### Direct addressing mode
- In the *direct addressing mode*, the instruction contains the memory address to access.
	- For example, we can load a register with the data at a particular address we specify, copying the memory-contents from the memory-location 
into the register.
#### Indexed addressing mode
- In the *indexed addressing mode*, the instruction contains a memory address to access, and also specifies an *index register* to offset that address.
	- For example, we could specify address 2002 and an index register. If the index register contains the number 4, the actual address the data is loaded from would be 2006. 
	- This way, if you have a set of numbers starting at location 2002, you can cycle between each of them using an index register.
	- On x86 processors, you can also specify a *multiplier* for the index.
	- Take the time to calculate these yourself to make sure you understand how it works.
#### Indirect addressind mode
- In the *indirect addressing mode*, the instruction contains a regster that contains a pointer to where the data should be accessed.
	- In direct addresing, we would just load the value directly specified with the register, but in indirect addressing, we use pointer values as the address to use to load the specified data we want in the memory to the register.
#### Base pointer addressing mode
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
	- As a computer, I will use fixed-sized data so that I can link one piece of data to the next with ease.
- If I had the pointer to the beginning of the employee record above, and wanted to access a particular piece of data inside it, what addressing mode would I use?
	- You would have to use an addressing mode that deals with addresses/pointers. Particularly, since you want to access the direct content of the given pointer's memory location, you will have to use th direct addressing mode which fulfills just that: loading a register with the data at a particular address specified, copying the memory-contents from the memory-location into the register.
- In base pointer addressing mode, if you have a register holding the value 3122, and an offset of 20, what address would you be trying to access?
	- You would be accessing memory-location 3142, but then sebsequently be trying to access the memory-location specified by the pointer retrieved from that memory-location.
- In indexed addressind mode, if the base address is 6512, the index rehister has a 5, and the multiplier is 4, what address would you be trying to adccess?
	- You would be trying to access 5 * 4 + 6512 = memory-location 6532.
- In indexed addressing mode, if the base address is 123472, the index register has a 0, and the multiplier is 4, what address would you be trying to access?
	- You would be trying to access 0 * 4 + 123472 = memory-location 123472, the same memory location as the given base address.
- In indexed addressing mode, if the base address is 9123478, the index register has a 20, and the multiplier is 1, what address would you be trying to access?
	- You would be trying to access 20 * 1 + 9123478 = memory-location 9123487. 

### Going Further
#### What are the minimum number of addressing modes needed for computation?
- One, direct-addressing mode.

#### Why include addressing modes that aren't strictly needed?
- Optimization.
- Ease.

#### Research and then describe how pipelining (or one of the other complicating factors) affects the fetch-execute cycle.
- Un-pipelined instruction cycles performs sequentially and finishes instructions one after another.
- Meanwhile, pipelining allows instruction cycles to perform concurrently or even in parallel: decoding, execution, and fetching of an instruction can occur all at once.

#### Research and then describe the tradeoffs between fixed-length instructions and variable-length instructions.
- Using fixed-length instructions means representing every instruction using the same number of bytes (ex: ARM and SPARC uses 4).
	- This however means that each individual instruction is limited to a certain complexity.
	- Furthermore, compound operations take a lot more instructions to be encoded into.
	- So, computers employing such kinds of fixed-length instructions are called a *Reduced Instruction Set Computer (RISC)* because the complexity of its instruction set is reduced.
- Using fixed-length instructions means representing different instructions using different number of bytes; there is no constraint in how many bytes can be used to encode an instruction (ex: Intel CPUs, M68000 processors).
	- This means that simpler operations can be encoded with fewer bytes.
	- Furthermore, more complex operations can be encoded within a single instruction.
	- Thus, a computer employing such instructions are called a *Complex Instruction Set Computer (CISC)*.

Nevertheless, the power of a computer is dictated by how many things it can do at once. CISC and RISC computers have their own sets of advantages and disadvantages that enable the underlying circuitry to achieve multitasking.