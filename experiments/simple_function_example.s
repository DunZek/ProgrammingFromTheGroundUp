# Used to study 4.4.
# PURPOSE:  Study how a simple C function works on the stack.
.section .data

.section .text

#
.globl _start
_start:
    # Call 'my_func':
    push $2         # (A)
    push $1         # (B)
    push $0         # (C)
    call my_func    # (D)
    add $24, %rsp

    # Print the answer:
    mov %rax, %rbx

    # Exit successfully:
    mov $1, %rax
    int $0x80


.type my_func, @function
my_func:
    # Preserve previous frame pointer and use current one:
    push %rbp       # (E)
    mov %rsp, %rbp  # %rsp points to (E), and after this instruction, so will %rbp

    # Allocate 24 bytes for local storage for three variables:
    sub $24, %rsp   # (Z)

    # 
    mov 32(%rbp), %rbx  # Parameter (3)                             (A)
    mov 24(%rbp), %rbx  # Parameter (2)                             (B)
    mov 16(%rbp), %rbx  # Parameter (1)                             (C)
    mov 8(%rbp), %rbx   # call's return address back to caller      (D)
    mov %rbp, %rbx      # previous frame pointer                    (E)
    mov -8(%rbp), %rbx  # Local variable (1)                        ...
    mov -16(%rbp), %rbx # Local variable (2)                        ...
    mov -24(%rbp), %rbx # Local variable (3)                        ...

    # Exit properly:
    mov %rbp, %rsp
    pop %rbp
    ret
