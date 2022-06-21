/* 

Performs signed multiplication and stores result in the second operand (either some specific one or %rax if not specified).

*/
.section .data

.section .text
.globl _start
_start:

    # Provide 3 as an operand:
    mov $3, %rbx

    imul $-9, %rbx  # 229 = 256 - 27 -> (..., 254, 255, 0)

    # Exit successfully:
    mov $1, %rax
    int $0x80
