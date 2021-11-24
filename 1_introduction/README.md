# Chapter 1. Introduction
 
## Welcome to Programming
- Donald Knuth describes programming not as a telling a computer how to do something, but telling a person how they would instruct a computer to do something.
- A programmer is a problem-solver, a poet, and an instructor all at once.
- At the end of this book, you should be able to do the following:
	- Understand how a program works and interacts with other programs
	- Read other people's programs and learn how they work
	- Learn new programming languages quickly
	- Learn advanced concepts in computer science quickly
- Don't get discouraged. It's a long climb, but very worthwhile.
- At the end of each chapter are three sets of review exercises:
	1. Regurgitation - checking if you can give back what you learned in the chapter.
	2. Application questions - checking if you can apply what you learned to solve problems.
	3. If you are capable of broadening your horizons, things to think about and to return to in the future.
- Learning the issues involved in programming, learning how to research answers, and learning how to look ahead are all major parts of a programmer's work.

## Your Tools
- This book teaches assembly language for x86 processors and the GNU/Linux operating system.
- Use GCC
- All you need to know otherwise is how to navigate the command line and how to use text-editors such as vim and emacs.
- Programs will not work with non-Linux operating systems such as BSD, etc. However, all of the *skills* learned in this book should be easile transferable to any other system.

### So what is GNU/Linux?
- The GCC tool set contains all of the programs necessary to create programs in various computer languages.
- Linux = *kernel*
	- The core, both a fence and a gate.
	- As a Gate:
		- allows programs to access hardware in a uniform way
		- handles device-specific interactions, file accesses, interactions between processes, etc.
	- As a Fence:
		- prevents programs from accidentally overwriting each other's data
		- prevents unwanted file and device access (permission handling)
- **Example 1-1. How the computer processes keyboard signals**
	- `Keyboard -> Kernel -> Windowing system -> Application program`

### This book will be using the computer's low-level assembly language
- There are essentially three kinds of languages:
	- Machine Language:
		- This is what the computer actually sees and deals with.
		- So, every command is a given number or sequences of numbers.
	- Assembly Language:
		- Same as machine language with exception to the replacement of command numbers using easier letter sequences.
		- Other small things are done to make it easier as well.
	- High-Level Language:
		- Make programming easier by easing code comprehension and expression
		- While Assembly language requires you to work with the machine itself, High-level languages allow you to describe the program in a more natural language.
		- A single command in a High-level language is usually equivalent to several commands in an Assembly language.
- In this book we will learn Assembly language, although we will cover a bit of high-level languages.
- Hopefully by learning assembly language, your understanding of how programming and computers work will put you a step ahead.
