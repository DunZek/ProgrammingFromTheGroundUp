# Copies a word of data from one location to another:
#   mov I/R/M, I/R/M
# Affects O/S/Z/A/C
.section .data

.section .text
.globl _start
_start:
    mov $10, %rbx

    # Exit properly:
    mov $1, %rax
    int $0x80
