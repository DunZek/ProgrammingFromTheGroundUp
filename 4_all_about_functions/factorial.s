# A program to compute the factorial given a number.
# Ex: Given 3, perform 3 * 2 * 1 or 6.
# Ex: Given 4, perform 4 * 3 * 2 * 1, or 24.
# Ex: etc.

# This program demonstrates recursion.

.section .data

# No global data used.

.section .text
.globl _start
.globl factorial    # to share this function with other programs

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


# A recursive function that calculates the factorial of a given number.
# %rax holds 
.type factorial, @function
factorial:
    # Preserve previous frame pointer and use current one:
    push %rbp
    mov %rsp, %rbp

    # Assign parameter to high-speed register:
    mov 16(%rsp), %rax  # (1) number

    # Exit condition (factorial exhausted):
    cmp $1, %rax
    je factorial_end

    # Consume a factorial:
    dec %rax

    # Call 'factorial' function to do %rax!:
    push %rax
    call factorial

    # 
    mov 16(%rbp), %rbx

    #
    imul %rbx, %rax

factorial_end:
    mov %rbp, %rsp
    pop %rbp
    ret
