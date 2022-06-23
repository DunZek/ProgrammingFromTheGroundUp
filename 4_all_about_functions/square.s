# A program to test the 'square' function.
# 13*13 = 169
.section .data

.section .text
.globl _start

_start:
    # Call 'square' function to do 13**2:
    push $13        # (1) number to get the square of
    call square     # transfer execution
    add $8, %rsp    # reset stack pointer

    # Print result:
    mov %rax, %rbx

    # Exit properly:
    mov $1, %rax
    int $0x80

# A function that returns the only parameter times by itself.
.type square, @function
square:
    # Preserve previous frame pointer and use current one:
    push %rbp
    mov %rsp, %rbp

    # Move argument to return register and multiply it by itself:
    mov 16(%rsp), %rax
    imul 16(%rsp), %rax

    # Return properly:
    mov %rbp, %rsp  # restore stack pointer
    pop %rbp        # restore previous frame pointer
    ret             # return execution to caller
