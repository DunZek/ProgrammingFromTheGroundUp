# PURPOSE:  
# PROCESSING:

.section .data

    .equ SYS_OPEN, 5
    .equ SYS_WRITE, 4
    .equ SYS_READ, 3
    .equ SYS_CLOSE, 6
    .equ SYS_EXIT, 1

    # 
    .equ O_READDONLY, 0
    .equ O_CREATE_WRITEONLY_TRUNC, 03101

    # Stadard file descriptors:
    .equ STDIN, 0
    .equ STDOUT, 1
    .equ STDERR, 2

    # Interrupt system call:
    .equ LINUX_SYSCALL, 0x80

    # Return value of read() when the end of a file is reached:
    .equ END_OF_FILE, 0

    .equ NUMBER_ARGUMENTS, 2

.section .bss
    # Where data is loaded into from the data file and written out to the output file. This should never exceed 16,000 for various reasons:
    .equ BUFFER_SIZE, 500
    .lcomm BUFFER_DATA, BUFFER_SIZE

.section .text

    # Stack positions:
    .