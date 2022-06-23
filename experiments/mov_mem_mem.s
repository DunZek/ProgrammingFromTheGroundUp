.section .data

.section .text
.globl _start
_start:


    # Exit properly:
    mov $1, %rax
    int $0x80
