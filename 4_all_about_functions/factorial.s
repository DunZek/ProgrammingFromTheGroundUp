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


factorial:

factorial_end:
    mov %rbp, %rsp
    pop %rbp
    ret