# PURPOSE:  Exits with a status code of 3.
# INPUT:    None.
# OUTPUT:   A status code of 3.
# VARIABLES:
#      %ebx holds the exit code     
#      %eax holds 1, to call the system call for exit  

.section .data

.section .text
.globl _start
_start:
    movl $3, %ebx
    movl $1, %eax
    int $0x80
