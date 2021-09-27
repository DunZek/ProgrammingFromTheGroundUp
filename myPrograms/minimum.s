#PURPOSE:		Find the smallest value in a
#				a list of values (excluding sentinel value)
#

#VARIABLES:		The following variables are used
#	%edi - Holds the index of the list
#	%ebx - Status number, holds the minimum number
#	%eax - System call, uses list sentinel value to 
# 		   stop program
#	

.section .data
data_items:
	.long 100,234,67,200,175,174,189,200,213,150,56,1,112,0

.section .text
.global _start
_start:
	movl $0, %edi					# Set index to first position
	movl data_items(,%edi,4), %eax	# Set %eax to first element in list
	movl %eax, %ebx					# Set %abx to current smallest element

start_loop:
	cmpl $0, %eax					# Compare 0 to current element 
	je exit_loop					# If current element is 0 (sentinel value),
									# then exit loop
	incl %edi						# Increment index to new position
	movl data_items(,%edi,4), %eax	# Set %eax to new element
	cmpl %ebx, %eax					# Compare smallest element to newest element
	jge start_loop					# If smallest element is less than or equal
									# to newest element, skip assignment and 
									# keep looping
	cmpl $0, %eax					# Skip over the sentinel value
	je start_loop

	movl %eax, %ebx					# Set %ebx to newly-found smallest element
	jmp start_loop 					# Keep looping until finished
	
exit_loop:
	movl $1, %eax					# Number for exit system-call
	int $0x80						# Send interrupt signal
