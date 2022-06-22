# My base**power program
.section .data

.section .text
.globl _start
_start:
    # Call 'power' function with these arguments:
    push $1         # (2) power
    push $2         # (1) base number
    call power      # transfer execution
    add $16, %rsp   # reset stack pointer

    # Print result as the status code:
    mov %rax, %rbx

    # Exit properly:
    mov $1, %rax
    int $0x80


.type power, @function
power:
    
    # Preserve previous frame pointer:
    push %rbp

    # Assign new frame pointer for current stack frame:
    mov %rsp, %rbp

    # Assign parameters to high-speed registers:
    mov 16(%rbp), %rbx
    mov 24(%rbp), %rcx

    # Store initial result:
    mov %rbx, %rax

power_loop:
    # Exit condition (powering exhausted):
    cmp $1, %rcx
    je power_end

    # 1. Consume a power:
    dec %rcx 

    # 2. Multiply the current result with the base number:
    imul %rbx, %rax

    # Repeat iteration:
    jmp power_loop

power_end:
    # Restore the stack pointer:
    mov %rbp, %rsp

    # Restore previous frame pointer:
    pop %rbp

    # Return control back to caller:
    ret
