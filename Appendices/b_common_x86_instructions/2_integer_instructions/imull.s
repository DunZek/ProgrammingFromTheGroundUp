.section .data

.section .text
.globl _start
_start:

    # 2**3 = 8
    mov $2, %rbx
    imul $2, %rbx
    imul $2, %rbx

    mov $1, %rax
    int $0x80
