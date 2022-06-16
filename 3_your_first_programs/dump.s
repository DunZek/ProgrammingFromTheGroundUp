# PURPOSE:  A file that serves as a testing ground for assembly logic.

.section .data

.section .text
.globl _start
_start:
    movl _start, %ebx       # 139
    # movl $_start, %ebx    # 0

exit_sucessfully:
    # movl $0, %ebx
    movl $1, %eax
    int $0x80
