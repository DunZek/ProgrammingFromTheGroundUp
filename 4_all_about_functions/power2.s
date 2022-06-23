/* A program that tests a 'power' function implemented in my own calling convention:
Ex: Given 3 and 5, perform 3 * 3 * 3 * 3 * 3

Changes:
1. No other register is used but the %rbp register.
2. Local variables substitute for registers.
3. Like in C, parameters are passed in reverse when calling.
4. Frame parameters continue remain as static constants.

Notes:
- I think C's calling convention works best.
- This is very memory inefficient.
- This is performantly slower as well as no high-speed registers are used. Instead, instructions are performed upon memory locations in stack.
- This gets me to practice using local variables.
*/

.section .data

.section .text
.globl _start
_start:
    # Call 'power' to do 3**5:
    push $5         # (2) power number
    push $3         # (1) base number
    call power      # transfer execution
    add $16, %rsp   # reset the stack pointer

    # Print result:
    pop %rbx

    # Exit properly:
    mov $1, %rax
    int $0x80

# 
.type power, @function
power:
    # Preserve previous frame pointer and use current one:
    push %rbp
    mov %rsp, %rbp

    # Allocate 16 bytes for two local variables:
    sub $16, %rsp   # (1) powering number
                    # (2) product/result

    # Assign arguments to local variables:
    mov 24(%rbp), -8(%rbp)  # power
    mov 16(%rbp), -16(%rbp) # result

power_loop:
    # Exit condition (powering number exhausted):
    cmp $1, -8(%rbp)

    # Consume a power:
    imul 16(%rbp), -16(%rbp)    # multiply to result
    dec -8(%rbp)                # reciprocate

    # Repeat:
    jmp power_loop

end_power:
    # Exit function properly:
    mov %rbp, %rsp  # restore stack pointer
    pop %rbp        # restore previous frame pointer
    ret             # transfer execution to caller using return address
