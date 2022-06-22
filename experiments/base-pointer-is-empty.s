/* 
The base pointer register is a free pointer designed to work as a free stack register.

Which, is unlike the stack pointer register, is continuously occupied by an ever changing address to the top of the stack.

Run this program a sufficient number of times to demonstrate.
*/

.section .data

.section .text
.globl _start
_start:

    # Push some values to the stack:
    call my_func


    # Exit properly, interrupt and perform call:
    mov $1, %rax
    int $0x80

.type my_func, @function
my_func:
    mov %rbp, %rbx

    ret
