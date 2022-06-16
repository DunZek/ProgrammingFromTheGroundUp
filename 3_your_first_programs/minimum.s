# PURPOSE:  Finds the smallest number found in a list of numbers.
# INPUT:    None.
# OUTPUT:   The smallest number found in a given list of numbers.
# VARIABLE:
#           %edi indexes the list.
#           %eax holds an element referred to by %edi.
#           %ebx holds the smallest number found.

.section .data

numbers:
    .long 100, 200, 10, 30, 55, 8, 255

.section .text
.globl _start

# Start with the first element:
_start:
    movl $0, %edi
    movl numbers(,%edi,4), %eax
    movl %eax, %ebx

# A procedure to find the minimum number from the given numbers list:
start_loop:
    # Exit if the sentinel value (255) is reached:
    cmpl $255, %eax
    je exit

    # Otherwise, select the next element:
    incl %edi
    movl numbers(,%edi,4), %eax

    # Jump to the start of the loop if the next element was bigger than the one found:
    cmpl %ebx, %eax
    jge start_loop

    # Otherwise, then the next element was smaller so assign it to the %ebx register and repeat the program:
    movl %eax, %ebx
    jmp start_loop

# Exit out of the program:
exit:
    movl $1, %eax
    int $0x80
