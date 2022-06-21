# PURPOSE:  This program converts an input file to an output file with all letters converted to upper-case.
# PROCESSING:
#           1. Open the input file
#           2. Open the output file
#           3. Until the end of the input file is reached:
#               3.1. Read part of the file into a memory buffer
#               3.2. Convert each lower-case letter byte into upper-case
#               3.3. Write the memory buffer to the output file

.section .data

    # System call numbers
    .equ SYS_OPEN, 5
    .equ SYS_WRITE, 4
    .equ SYS_READ, 3
    .equ SYS_CLOSE, 6
    .equ SYS_EXIT, 1

    # 
    .equ O_READDONLY, 0
    .equ O_CREATE_WRITEONLY_TRUNC, 03101

    # Standard file descriptors:
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