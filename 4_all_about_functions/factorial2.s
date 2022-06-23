# A program to demonstrate a non-recursive implementation of calculating factorials.
# Ex: Given 5, perform 5 * 4 * 3 * 2 * 1 = 120

.section .data

.section .text
.globl _start
_start:
    # Call 'factorial' to do 5!:
    push $5         # (1) number to do factorial of
    call factorial  # transfer execution
    add $8, %rsp    # reset stack pointer

    # Print result (5! = 120):
    mov %rax, %rbx

    # Exit properly:
    mov $1, %rax    # call exit system call
    int $0x80       # interrupt program

# A non-recursive function that calculates the factorial of a given number:
# %rax holds the current product (and return value).
# %rbx holds the current multiplier.
.type factorial, @function
factorial:
    # Preserve previous frame pointer and use current one:
    push %rbp
    mov %rsp, %rbp

    # Set multiplier
    mov 16(%rbp), %rbx

    # Set first product:
    mov $1, %rax

factorial_loop:
    # Exit condition (the multiplier is exhausted):
    cmp $1, %rbx
    jle factorial_end

    # Multiply current product:
    imul %rbx, %rax

    # Consume a multiplier:
    dec %rbx

    # Repeat:
    jmp factorial_loop

factorial_end:
    # Return properly:
    mov %rbp, %rsp  # restore stack pointer
    pop %rbp        # restore previous frame pointer
    ret             # return execution to caller
