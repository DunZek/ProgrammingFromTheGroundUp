# Used to study 4.4.
# PURPOSE:  Study how a simple C function works on the stack.
.section .data

.section .text

#
.globl _start
_start:
    # Push Y and X to the stack and call function:
                # ...
    push $10    # Parameter 2 <-- (%esp)

                # ...
                # Parameter 2 
    push $10    # Parameter 1 <-- (%esp)
    call my_func

    # Reset stack pointer back to where it was before calling the next function:
    add $8, %rsp

    # Print the answer:
    mov %rax, %rbx

    # Exit successfully:
    mov $1, %rax
    int $0x80


# PURPOSE:  Adds X to Y and return result,
# INPUT:
#           (1) X
#           (2) Y
# OUTPUT:   X + Y
# VARIABLES:
#
#
.type my_func, @function
my_func:
    # Preserve previous frame pointer.
    push %rbp   # 
                #
                # Return Address <--

    # Create a frame pointer pointing to 
    mov %rsp, %rbp

    mov 

    ret
