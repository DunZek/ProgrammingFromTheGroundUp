/*Some changes since 2003/2004:
We live in a 64-bit dominant era now.

Error: invalid instruction suffix for push
    Fix -> https://stackoverflow.com/a/21680219/13973029

Error: operand type mismatch for pop
    Fix -> https://stackoverflow.com/a/29573784/13973029
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

    # 3. Move stack pointer back:
    add $8, %rsp   

    # 4. Save the first answer before calling the next function:
    push %rax      

    # 1. Push second and first argument to the stack respectively:
    push $2
    push $5

    # 2. Call the 'power' function:
    call power

    # 3. Move stack pointer back:
    add $8, %rsp

    # 4. 
    pop %rbx

    # Perform 2^3 + 5^2:
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
#           -4(%ebp) holds the current result.
#           %rax is temporary storage.
.type power, @function
power:
    # Save old base pointer (the return address?):
    push %rbp

    # Make stack pointer the base pointer:
    mov %rsp, %rbp

    # Make room for local storage:
    sub $4, %rsp

    # Access the first and second arguments respectively:
    mov 8(%rbp), %rbx
    mov 12(%rbp), %rcx

    # Store current result temporarily for later:
    mov %rbx, -4(%rbp)

power_loop_start:
    # End the powering loop once the power is done:
    cmp $1, %ecx
    je end_power

    # 
    mov -4(%rbp), 

end_power:


