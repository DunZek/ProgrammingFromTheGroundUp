/*  Function Call Statement:

    Implementing functions in assembly requires pushing arguments to the stack in reverse order, then issuing a 'call' instruction. Those arguments should be popped off the stack afterwards.

    For example:

        printf("The number is %d", 88);

    To implement in assembly:
*/
.section .data
text_string:
    .ascii "The number is %d\0"

.section .text
.globl _start
_start:
    push $88
    push $text_string
    call printf
    pop %rax
    pop %rax

    # You can also directl re-adjust %rsp to the proper location.

    # Exit properly:
    mov $1, %rax
    int $0x80
