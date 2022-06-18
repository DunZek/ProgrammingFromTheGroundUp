.section .data

.section .text
.globl _start
_start:
    mov     $10, %ebx

    # Exit properly, interrupt and perform call:
    mov $1, %rax
    int $0x80
