#PURPOSE:	Simple program that exists and returns a
#			status code back to the Linux kernel
#

#INPUT:		none
#

#OUTPUT:	returns a status code. This can be viewed 
#			by typing
#			
#			echo $?
#
#			after running the program
#

#VARIABLES:
#			%eax holds the system call number
#			%ebx holds the return status
#
.section .data

.section .text
.globl _start
_start:
	movq $1, %rax	# this is the linux kernel command
					# number (system call) for exiting
					# a program

	movq $0, %rbx	# this is the status number we will
					# return to the operating system.
					# Change this around and it will
					# return different things to echo $?

	int $0x80		# this wakes up the kernel to run
					# the exit command

#STRANGE THINGS:
#			A segmentation fault error occurs on WSL1.
#			The image must be updated to WSL2. 
#			
# 			Solution:
#			https://stackoverflow.com/questions/67782451/programming-assembly-in-wsl2-x86-64-unix-cant-make-32-bit-syscall
# 
