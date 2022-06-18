# PURPOSE:  A file that serves as a testing ground for assembly logic.

.section .data
data_items:
	# The given list of 14 numbers, each element the length of a word:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start

_start:
    movl $0, %ebx

exit_sucessfully:
    # movl $0, %ebx
    movl $1, %eax
    # int $0x80
