# Examining how executable arguments works (introduced alongside in 5).

.section .data
    # Stack constants from %rsp upon runtime:
    .equ ST_ARGC, 0     # program arguments
    .equ ST_ARGV_0, 8   # program name
    .equ ST_ARGV_1, 16  # (1)
    .equ ST_ARGV_2, 24  # (2)
    .equ ST_ARGV_2, 32  # (3)
                        # ...
                        # (n)

.section .text
.globl _start
_start:
    # Use the stack pointer:
    mov %rsp, %rbp

    # Print arguments (of course, you can use the constants instead):
    mov %rbp, %rax      # program arguments
    mov 8(%rbp), %rbx   # program name
    mov 16(%rbp), %rcx  # (1)
    mov 24(%rbp), %rdx  # (2)
    mov 32(%rbp), %rex  # (3)

    # Exit properly:
    mov $1, %rax
    int $0x80
