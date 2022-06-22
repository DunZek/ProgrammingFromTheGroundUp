/*
Unbeknownst to me, 64-bit registers by default use 8-byte words.

So we've had to modify our programs to accommodate that modern change.
*/

.section .data

.section .text
.globl _start
_start:
    # Push some values to the stack:
    push $10
    push $20
    push $30

    # These shouldn't be weird:
    push %rbp 
    mov %rsp, %rbp

    # (Deprecated) Print '20', which is 8 bytes away from '30':
    mov 8(%rbp), %rbx

    # Exit properly, interrupt and perform call:
    mov $1, %rax
    int $0x80
