# Used to study 4.4.
# PURPOSE:  Study how a simple C function works on the stack.
.section .data

.section .text

#
.globl _start
_start:
    mov $2, %rax

    call my_func

    # Print the answer:
    mov %rax, %rbx

    # Exit successfully:
    mov $1, %rax
    int $0x80


.type my_func, @function
my_func:

    imul $2, %rax
    imul $2, %rax

    ret
