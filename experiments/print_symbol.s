.section .data

.section .text
.globl _start
_start:
    mov _exit, %rbx

_exit:
    mov $1, %rax
    int $0x80
