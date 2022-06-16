# PURPOSE:	Finds the biggest number of from a set of numbers.
# INPUT:	None.
# OUTPUT:	The biggest number.
# VARIABLES:
# 			%edi holds the index of the data item being examined.
# 			%eax holds current data items from the set.
# 			%ebx holds the Largest data item found.

.section .data

data_items:
	# The given list of 14 numbers, each element the length of a word:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0


.section .text

.global _start
_start:
	movl $0, %edi
	movl data_items(,%edi,4), %eax	
	movl %eax, %ebx					

start_loop:
	movl $data_items, %ebx
	jmp loop_exit

	# Terminate loop after the given list's ending address is reached.
	cmpl $0, %edi
	je loop_exit

	incl %edi						
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax					
	jle start_loop					
	movl %eax, %ebx					
	jmp start_loop					

loop_exit:
	movl $1, %eax	
	int $0x80
