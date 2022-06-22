/*  If/Else Statement:

    An If/Else statement in C consists of three parts:
    - the condition
    - the true branch
    - the false branch

    For example:

        if (a == b) {
            // true branch
        } else {
            // false branch
        }
        // Converge

    To implement C's block structures:
*/
.section .data
    .equ A, 50
    .equ B, 50

.section .text
.globl _start:
_start:
    # Compare values A and B:
    mov A, %rax
    mov B, %rbx
    cmpl %rax, %rbx

    je true_branch

    # False branch code:
    # ...

    jmp reconverge


true_branch:
    # ...


reconverge:
    # ...


/*  - A linear language such as assembly needs to jump around.
    - Case statements would be written as a sequence of these.
*/