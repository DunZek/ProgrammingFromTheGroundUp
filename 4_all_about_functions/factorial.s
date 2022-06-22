# A program to compute the factorial given a number.
# Ex: Given 3, perform 3 * 2 * 1 or 6.
# Ex: Given 4, perform 4 * 3 * 2 * 1, or 24.
# Ex: etc.

# This program demonstrates recursion.

.section .data

# No global data used.

.section .text
.globl _start
.globl factorial    # needed to share this function to other programs

_start:
    # Call 'factorial' function to do 4!:
    push $4         # (1) number
    call factorial  # transfer execution
    add $8, %rsp    # reset stack pointer

    # Print result as the status code:
    mov %rax, %rbx

    # Exit properly:
    mov $1, %eax
    int $0x80


.type factorial, @function
factorial:

factorial_end:
    mov %rbp, %rsp
    pop %rbp
    ret