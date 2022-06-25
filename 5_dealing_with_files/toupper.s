/* This program converts an input file to an output file with all letters converted to upper-case:
1. Opens an input file
2. Opens an output file
3. Does, until the end of the input file is reached:
    3.1. reads part of the input file into a memory buffer
    3.2. converts each lower-case letter byte into upper-case
    3.3. writes the memory buffer to the output file
*/

.section .data
# System call numbers
.equ SYS_OPEN, 5
.equ SYS_WRITE, 4
.equ SYS_READ, 3
.equ SYS_CLOSE, 6
.equ SYS_EXIT, 1

/* Options for 'open': 
- Look at /usr/include/asm/fcntl.h for various values. 
- You can combine them by adding them or OR-ing them.
- This is discussed at greater length in "Counting Like a Computer". */
.equ O_READDONLY, 0
.equ O_CREATE_WRITEONLY_TRUNC, 03101

# Standard file descriptors:
.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2

# Interrupt system-call:
.equ LINUX_SYSCALL, 0x80

# Return value of 'read' when the end of a file is reached:
.equ END_OF_FILE, 0

.equ NUMBER_ARGUMENTS, 2

.section .bss
/* Buffer:
- This is where data from the input file is loaded into and written out to the output file. 
- This should never exceed 16,000 bytes for various reasons. */
.equ BUFFER_SIZE, 500
.lcomm BUFFER_DATA, BUFFER_SIZE

.section .text
# Stack positions:
.equ ST_SIZE_RESERVE, 16
.equ ST_FD_IN, -8
.equ ST_FD_OUT, -16
.equ ST_ARGC, 0     # number of arguments
.equ ST_ARGV_0, 8   # name of program
.equ ST_ARGV_1, 16  # input filename
.equ ST_ARGV_2, 24  # output filename

.globl _start
_start:
    # Preserve the stack pointer:
    mov %rsp, %rbp

    # Allocate space for the file descriptors:
    sub $ST_SIZE_RESERVE, %rsp

open_files:
    open_fd_in:
        # Open input file:
        mov $SYS_OPEN, %rax         # open syscall
        mov ST_ARGV_1(%rbp), %rbx   # input filename
        mov $O_READDONLY, %rcx      # read-only flag
        mov $0666, %rdx             # rw-rw-rw permissions
        int $LINUX_SYSCALL          # interrupt program

    store_fd_in:
        # Save given file descriptor:
        mov %rax, ST_FD_IN(%rbp)

    open_fd_out:
        # Open output file:
        mov $SYS_OPEN, %rax                 # open syscall
        mov ST_ARGV_2(%rbp), %rbx           # output filename
        mov $O_CREATE_WRITEONLY_TRUNC, %rcx # write-only file
        mov $0666, %rdx                     # rw-rw-rw permissions
        int $LINUX_SYSCALL                  # interrupt program

    store_fd_out:
        # Store file descriptor:
        mov %rax, ST_FD_OUT(%rbp)

read:
    # Read a block of the input file:
    mov $SYS_READ, %rax         # ???
    mov ST_FD_IN(%rbp), %rbx    # ???
    mov $BUFFER_DATA, %rcx      # location to read
    mov $BUFFER_SIZE, %rdx      # location size
    int $LINUX_SYSCALL          # interrupt program

    # Exit when the reach is end:
    cmp $END_OF_FILE, %rax  # check EOF value
    jle read_end            # stop read if found EOF or an error

read_loop:
    # Convert character block to upper-case:
    push $BUFFER_DATA       # (2) buffer location
    push %rax               # (1) buffer size
    call to_upper   # transfer execution
    pop %rax                # get back size
    add $8, %rsp            # reset stack pointer

    # Write the block to the output file:
    mov %rax, %rdx              # buffer size
    mov $SYS_WRITE, %rax        # ???
    mov ST_FD_OUT(%rbp), %rax   # file used
    mov $BUFFER_DATA, %rcx      # buffer location
    int $LINUX_SYSCALL          # interrupt program

    # Continue loop:
    jmp read

read_end:
    # Close files (error checking is irrelevant):

    mov $SYS_CLOSE, %rax        # close syscall
    mov ST_FD_OUT(%rbp), %rbx   # output file
    int $LINUX_SYSCALL          # interrupt program

    mov $SYS_CLOSE, %rax        # close syscall
    mov ST_FD_IN(%rbp), %rbx    # input file
    int $LINUX_SYSCALL          # interrupt program

    # Exit properly:
    mov $SYS_EXIT, %rax
    mov $0, %rbx
    int $LINUX_SYSCALL

/* A function to convert a block of english ASCII characters into upper-case.
Input:
- First parameter holds the location of the memory block to convert.
- Second parameter holds the buffer length.

Output:
- overwrites the current buffer with the upper-cased version

Variables:
- %rax holds the beginning of the buffer.
- %rbx holds the length of the buffer.
- %rdi holds the current buffer offset.
- %cl (first part of %ecx) holds the current byte being examined. */

# Conversion constants:
.equ LOWERCASE_A, 'a'   # lower search boundary
.equ LOWERCASE_Z, 'z'   # upper search boundary
.equ UPPER_CONVERSION, 'A' - 'a'    # difference to apply conversion

# Stack constants:
.equ ST_BUFFER_LEN, 8   # buffer length
.equ ST_BUFFER, 12      # actual buffer

to_upper:
    push %rbp       # 
    mov %rsp, %rbp  # 

    # Set up variables:
    mov ST_BUFFER(%rbp), %rax
    mov ST_BUFFER_LEN(%rbp), %rbx
    mov $0, %rdi

    # If the buffer length given was 0, exit:
    cmp $0, %rbx
    je end_loop

to_upper_loop:
    # Get the current byte:
    movb (%rax,%edi,1), %cl

    # Go to the next byte unless it is between 'a' and 'z':
    cmpb $LOWERCASE_A, %cl
    jl next_byte
    cmpb $LOWERCASE_Z, %cl
    jg next_byte

    # Otherwise, convert the byte to uppercase:
    addb $UPPER_CONVERSION, %cl
    movb %cl,(%eax,%edi,1)

next_byte:
    # Next byte:
    inc %rdi

    # Continue unless we've reached the end:
    cmp %rdi, %rbx

    jne to_upper_loop

to_upper_end:
    # No return value. Just leave:
    mov %rbp, %rsp  # restore stack pointer
    pop %rbp        # restore previous frame pointer
    ret             # transfer execution to caller

    