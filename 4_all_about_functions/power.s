/* Some changes since 2003/2004 + notes:
We live in a 64-bit dominant era now.

Error: invalid instruction suffix for push
    Fix -> https://stackoverflow.com/a/21680219/13973029

Error: operand type mismatch for pop
    Fix -> https://stackoverflow.com/a/29573784/13973029

Also, 64-bit registers (rax, rbx, etc.) use 8-byte words instead of 4-byte ones (unlike eax, ebx, etc.). So, compensate for that.

An explanation of the stack's base pointer register:
    Note -> https://stackoverflow.com/questions/1395591/what-is-exactly-the-base-pointer-and-stack-pointer-to-what-do-they-point
*/

# PURPOSE:  A program to illustrate how functions work by  
#           computing the value of 2^3 + 5^2. 

.section .data
# Everything in the main program is stored in registers so the data section doesn't need anything.

.section .text
.globl _start
_start:
    # 1. Push second and first argument to the stack respectively:
    push $3    
    push $2    

    # 2. Call the 'power' function:
    call power

    # 3. Reset the stack pointer back to where it was:
    add $16, %rsp

    # 4. Save the first answer before calling the next function:
    push %rax 

    # 1. Push second and first argument to the stack respectively:
    push $2
    push $5

    # 2. Call the 'power' function:
    call power

    # 3. Reset the stack pointer back to where it was:
    add $16, %rsp

    # 4. Retrieve the first answer we saved before performing the addition:
    pop %rbx

    # Perform 2^3 + 5^2 and store:
    add %rax, %rbx

    # Exit properly: (1) set system call (2) interrupt the program:
    mov $1, %eax
    int $0x80


# PURPOSE:  A function to compute the value of a number raised to 
#           a power.
# INPUT:    
#           (1) The base number.
#           (2) The power to raise the base up to.
# OUTPUT:   Returns the result value.
# NOTES:    The power must be 1 or greater.
# VARIABLES:
#           %rbx holds the base number.
#           %rcx holds the power.
#           -4(%rbp) holds the current result.
#           %rax is temporary storage.
.type power, @function
power:
    # Preserve current frame pointer ():
    push %rbp

    # Create new frame pointer pointing to current stack top and use it for later:
    mov %rsp, %rbp

    # Allocate 8 bytes for local storage for one variable:
    sub $8, %rsp

    # Access the first and second arguments respectively:
    mov 8(%rbp), %rbx
    mov 16(%rbp), %rcx

    # Store current result temporarily for later:
    mov %rbx, -8(%rbp)


power_loop_start:
    # End the powering loop once the power value is exhausted:
    cmp $1, %rcx
    je end_power

    # Move current result into %eax:
    mov -8(%rbp), %rax

    # Multiply current result by the base number:
    imul %rbx, %rax

    # Store the current result:
    mov %rax, -8(%rbp)

    # Decrement the power:
    dec %rcx

    # Repeat calculations from the top:
    jmp power_loop_start

end_power:
    # Store return value in the register for later outside:
    mov -8(%rbp), %rax

    # Restore the stack pointer:
    mov %rbp, %rsp

    # Restore the previous frame's pointer 
    pop %rbp

    # 
    ret
