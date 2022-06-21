/* 
- https://blog.devgenius.io/writing-an-x86-64-assembly-language-program-648b6005e8e
- Converted to AT&T syntax for GCC on Linux.
*/

# 
# 
# 

.section .data

.section .text
.globl _start
_start:
    #
    call printNumberOfArgs

    #
    call printNewline

    #
    call printArg

    #
    call printNewline

    # 
    call exit


printNumberOfArgs:


printNewline:


printArg:


exit:
    mov $1, %rax
    int $0x80
