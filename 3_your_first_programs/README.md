# Chapter 3. Your First Programs

In this chapter, you will learn:
- The process for writing and building Linux assembly-language programs.
- The structure of assembly-language programs, and a few assembly-language commands.

As you go through this chapter, you may want to refer to Appendix B and Appendix F.

> *These programs may overwhelm you at first. However, go through them with diligence, read them and their explanations as many times as necessary, and you will have a solid foundation of knowledge to build on. Please tinker around with the programs as much as you can. Even if your tinkering does not work, every failure will help you learn.*


## Review

### Know the Concepts
- What does it mean if a line in the program starts with the `#` character?
    - > This line becomes a comment.
- What is the difference between an assembly language file and an object code file? 
    - > An assembly language file is source code that becomes an object code file.
- What does the linker do?
    - > The linker creates an executable ready to be ran on the machine from an object code file.
- How do you check the result status code of the last program you ran?
    - > `echo $?`
- What is the difference between `movl $1, %eax` and `movl 1, %eax`?
    - The difference lies in the addressing modes. The former is immediate and the latter is direct-addressing.
- Which register holds the system call number?
    - `%ebx`
- What are indexes used for?
    - Indices are used to select an item from a list.
- Why do indexes usually start at 0?
    - Indices select an item from a list a certain distance away from the first element. So, to start, an index of 0 refers to the first element.
- If I issued the command `movl data_items(,%edi,4), %eax` and `data_items` was address 3634 and `%edi` held the value 13, what address would you be using to move into `%eax`?
    - The resulting address calculated from that indexed-addressing operand would be 3634 + `%edi` * 4.
- List the general-purpose registers.
    - On x86 processsors, there are `%eax`, `%ebx`, `%ecx`, `%edx`, `%edi`, `%esi`.
- What is the difference between `movl` and `movb`?
    - `movl` moves data in words (4 bytes) while `movb` moves them in bytes smaller than words.
- What is flow control?
    - Flow control is a program's capability to control how instructions are executed.
- What does a conditional jump do?
    - Conditional jumps upon a certain condition met from its operands to a certain part of an assembly program.
- What things do you have to plan for when writing a program?
    - Everything, what inputs are used, what output is to be produced, ALL the procedures that take data of wherever origin to produce the output, what exactly that data is, etc.
- Go through every instruction and list what addressing mode is being used for each operand.
    - What?

### Use the Concepts
- Modify the first program to return the value 3.
    - [Modified program](./exit2.s)
- Modify the maximum program to find the minimum instead.
    - [Modified program](./minimum.s)
- Modify the maximum program to use the number 255 to end the list rather than the number 0.
    - [Modified program](./maximum2.s)
- Modify the maximum program to use an ending address rather than the number 0 to know when to stop.
    - [Modified program](./maximum3.s)
- Modify the maximum program to use a length count rather than the number 0 to know when to stop.
    - [Modified program](./maximum4.s)
- What would the instruction `movl _start, %eax` do? Be specific, based on your knowledge of both addressing modes and the meaning of `_start`. How would this differ from the instruction `movl $_start, %eax`?
    - `movl _start, %eax` moves the value of what the byte address of `_start` points to to `%eax`.
    - `movl $_start, %eax` moves the value of the byte address of `_start` into `%eax`.
    

### Going Further
- Modify the first program to leave off the `int` instruction line. Assemble, link, and execute the new program. What error message do you get. Why do you think this might be?
    - Segmentation fault (core dumped)
    - The program continues to run inadvertently, trespassing memory locations.
- So far, we have discussed three approaches to finding the end of the list - using a special number, using the ending address, and using the length count. Which approach do you think is best? Why? Which approach would you use if you knew that the list was sorted? Why?
    - Using a sentinel value is best.
    - It is very simple and flexible, causing the least problems.
    - Not sure.
    - Not sure.