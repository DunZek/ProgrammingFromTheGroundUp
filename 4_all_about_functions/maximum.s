# A program to test the 'maximum' function three times and returns/prints the result of the last call.
.section .data
first_items: 
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0  # 222
second_items:
    .long 1,11,2,3,22,4,33,5,6,44,7,8,9,55,10,11,0  # 55
third_items:
    .long 44,167,23,99,87,100,243,98,179,230,135,0  # 243

.section .text
.globl _start
_start:
    # Call 'maximum' function for the first address in 'first_items':
    push first_items    # (1) address to the first item
    call maximum        # transfer execution
    add $8, %rsp        # reset stack pointer

    # Call 'maximum' function for the first address in 'second_items':
    #push second_items   # (1) address to the first item
    #call maximum        # transfer execution
    #add $8, %rsp        # reset stack pointer

    # Call 'maximum' function for the first address in 'third_items':
    #push third_items    # (1) address to the first item
    #call maximum        # transfer execution
    #add $8, %rsp        # reset stack pointer

    # Print result:
    mov %rax, %rbx

    # Exit properly:
    mov $1, %rax
    int $0x80

# A looping function that finds the biggest number in a list of items.
.type maximum, @function
maximum:
    # Preserve previous frame pointer and use current one:
    push %rbp
    mov %rsp, %rbp

    mov 16(%rbp), %rax
    ret

    # Set the first item:
    mov $0, %rdi        # first index
    mov (,%rdi,8), %rax # first item
    mov %rax, %rbx      # current biggest item

maximum_loop:
    # Exit condition (sentinel value reached):
    cmp $0, %rax
    je maximum_end

    # Select next item:
    inc %rdi
    mov (,%rdi,8), %rax

    # If the current biggest is still the bigger number, repeat again:
    cmp %rbx, %rax
    jge maximum_loop

    # Otherwise, assign the newest biggest and repeat again:
    mov %rax, %rbx
    jmp maximum_loop

maximum_end:
    # Return properly:
    mov %rbp, %rsp  # restore stack pointer
    pop %rbp        # restore previous frame pointer
    ret             # return execution to caller
