# PURPOSE:  A file that serves as a testing ground for assembly logic.

.section .data
numbers:
    .long 111,222,33,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2,1,1,2,3,5,5,6
thumbers:
    .long 40, 50, 60

.section .text
.globl _start

_start:
    movl $30, %edi
    movl $numbers, %ebx
    # movl $_start, %ebx

exit_sucessfully:
    # movl $0, %ebx
    movl $1, %eax
    int $0x80
