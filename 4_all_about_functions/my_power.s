# My base**power program that doesn't use a local variable.
# My changes:
#   1. Start the result value with 1 instead of the base number.
#   2. End loop when power reaches 0, not 1.
.section .data

.section .text
.globl _start
_start:
    # Call 'power' function to do 5**0:
    push $0         # (2) power
    push $5         # (1) base number
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
    mov 16(%rbp), %rbx  # 8(%rbp) is the return address pushed
    mov 24(%rbp), %rcx  # by 'call power' in the caller routine.

    # Store initial result:
    mov $1, %rax

power_loop:
    # Exit condition (powering exhausted):
    cmp $0, %rcx
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
