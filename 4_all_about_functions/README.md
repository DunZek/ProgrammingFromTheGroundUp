# Chapter 4. All About Functions

## Review

### Know the Concepts
- What are primitives?
    - Atomic units that represent data or routines.
- What are calling conventions?
    - The way functions are called/executed in a language.
- What is the stack?
    - A segment of memory, particularly located at the end, growing backwards, where values are stored and kept tracked of for a program to do its processing.
- How do `push` and `pop` affect the stack? What special-purpose register do they affect?
    - `push` and `pop` respectively push and pop values to and off the stack (create them there/remove them and put it somewhere else).
    - They affect `%rsp`, which constantly keeps track of the top of the stack normally.
- What are local variables and what are they used for?
    - Local variables are locations in stack in a particular stack frame used by the frame's function.
    - These are used as temporary locations to supplement the limited number of registers available and to localize values to a particular stack frame.
- Why are local variables so necessary in recursive functions?
    - Because registers are used with each recursion. Thus, any work relying on a generative procedure using the state of previous calls need them (as a location within the stack frame like parameters, etc.).
- What are `%rbp` and `%rsp` used for?
    - `%rbp` is a free register that supplements the work done within a stack frame, freeing up `%rsp`.
    - `%rsp` is a register that continually points to the current top of the stack; a particular location in memory used when functions are to be called.
- What is a stack frame?
    - A stack frame describes a continuous memory segment in the stack where values are kept and that a particular function uses to conduct its processing.

### Use the Concepts
- Write a function called `square` which receives one argument and returns the square of that argument. 
    - [./square.s](./square.s)
- Write a program to test your square function.  
    - [./square.s](./square.s)
- Convert the `maximum` program given in the Section called *Finding a Maximum Value in Chapter 3* so that it is a function which takes a pointer to several values and returns their maximum. 
    - [./maxima.s](./maxima.s)
- Write a program that calls maximum with 3 different lists, and returns the result of the last one as the program’s exit status code.
    - [./maxima.s](./maxima.s)
- Explain the problems that would arise without a standard calling convention.
    - Without a standard calling convention, there is no telling how various different and perhaps specialized programs can interface with each other and perform aggregate work/provide a service as an application.

### Going Further
- Do you think it’s better for a system to have a large set of primitives or a small one, assuming that the larger set can be written in terms of the smaller one?
- The factorial function can be written non-recursively. Do so.
- Find an application on the computer you use regularly. Try to locate a specific feature, and practice breaking that feature out into functions. Define the function interfaces between that feature and the rest of the program.
- Come up with your own calling convention. Rewrite the programs in this chapter using it. An example of a different calling convention would be to pass paramters in registers rather than the stack, to pass them in a different order, to return values in other registers or memory locations. Whatever you pick, be consistent and apply it throughout the whole program.
- Can you build a calling convention without using the stack? What limitations might it have?
- What test cases should we use in our example program to check to see if it is working properly?