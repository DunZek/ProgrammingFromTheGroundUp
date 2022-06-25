# Examining how file access works (the IO introduced in 5).
.section .data

    # Syscall numbers:
    .equ SYS_OPEN, 5

    # Options for 'open':
    .equ O_READONLY, 0
    .equ O_CREATE_WRITEONLY_TRUNC, 03101

    # Standard file descriptors:

    # Stack constants:
    # .equ ST_SIZE_RESERVE, 16
    # .equ ST_FD_IN, -8
    .equ ST_ARGC, 0     # number of arguments
    .equ ST_ARGV_1, 16

    # Interrupt value:
    .equ LINUX_SYSCALL, 0x80

.section .text
.globl _start
_start:
    # Use the stack pointer:
    mov %rsp, %rbp

    # Allocate space for two file desciptors:
    # sub 16, %rsp

    # Open input file:
    # mov $5, %rax        # open syscall
    mov 16(%rbp), %rbx  # input filename
    # mov $0, %rcx        # read-only flag
    # mov $0666, %rdx     # rw-rw-rw permissions
    # int $0x80           # interrupt program

    # Save given file descriptor:
    mov %rax, -8(%rbp)

    # Exit properly:
    mov $1, %rax
    int $0x80
