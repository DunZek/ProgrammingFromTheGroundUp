#PURPOSE:	This program finds the maximum number of a
#			set of data items.
#

#VARIABLES:	The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found. Maximum exit status = 255
# 								  otherwise.
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#			   to terminate the data.
#

.section .data

data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0


.section .text

.global _start
_start:
	# Set the first element to the registers:
	movl $0, %edi				
	movl data_items(,%edi,4), %eax	
	movl %eax, %ebx					

start_loop:			
	# If 0, the sentinel value was found, exit:
	cmpl $0, %eax					
	je loop_exit

	# Otherwise, increment through loop:
	incl %edi						
	movl data_items(,%edi,4), %eax

	# If the biggest one found is still bigger, iterate from start:
	cmpl %ebx, %eax					
	jle start_loop					

	# Otherwise, then set the newest biggest number and repeat.
	movl %eax, %ebx					
	jmp start_loop					

loop_exit:
	# Interrupt and perform exit syscall:
	movl $1, %eax
	int $0x80


 
