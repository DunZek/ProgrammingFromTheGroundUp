## Planning the Program

In our next program, we will try to find the biggest number from a list of numbers.

Computers are very detail-oriented, so in order to write the program we will have to have planned out a number of details:
- Where will the original list of numbers be stored?
- What procedure will we need to follow to find the maximum number?
- How much storage do we need to carry out that procedure?
- Will all of the storage fit into registers, or do we need to use some memory as well?

A computer needs a plan of ***every*** step of the way. So, let's do a little planning:
- First of all, just for reference, let's name the address where the list of numbers starts as `data_items`.
- Let's say that the last number in the list will be a zero, so we know where to stop.
- We also need individual values to hold:
	- the current position in the list.
	- the current list element being examined.
	- the current highest value on the list.

Let's assign each of those a register:
- `%edi` will hold the current position in the list.
- `%ebx` will hold the current highest value in the list.
- `%eax` will hold the current element being examined.

When we begin the program and look at the first item in the list, since we haven't seen any other items, that item will automatically be the current largest element in the list. 

Also, we will set the current position in the list to be zero; the first element. From then on, we will execute the following steps:
1. Check the current list element (`%eax`) to see if it's a zero (the terminating element or *sentinel value*).
2. If it is a zero, then exit.
3. Otherwise, define the next position for the next execution iteration by incrementing `%edi`.
4. Load the next value in the list into the current value register (`%eax`).
5. Compare the current value (`%eax`) with the current highest value (`%ebx`)
6. If the current value is greater than the current highest value, replace the current highest value with the current one being examined from the list.
7. Repeat all of these steps from the start.

What addressing mode might we use here? Why?
- Register-addressing mode: containing a register to access and retrieve data from rather than a memory location.
- We are loading the next value in the list, a list and its values which we have registered into a register, and so the list must be accessed using register-addressing mode.

These "if"s are a class of instructions called *flow control* instructions because they tell the computer which paths to take and which steps to follow. 

In the previous program, we did not have any flow control instructions, as there was only one possible path to take: `exit`. This program is much more dynamic in that it is directed by data. Depending on what data this program receives, it will follow different instruction paths. This will be accomplished by two different instructions:
- A conditional jump to change paths based on the results of a previous comparison or calculation.
- An unconditional jump which just goes directly to a different path or part of the program no matter what.

Another use of flow control is in implementing *loops*, which are pieces of program code that are repeated. The first part of the program was only done once, so it wasn't a loop. However, the next part is repeated over and over again for every number in the list, terminating only when the sentinel value is encountered.

Loops are implemented by doing unconditional jumps to the beginning of the loop, being placed at the end of the loop, causing it to start over.

Remember to always have a conditional jump to exit the loop somewhere or the loop will continue forever! This condition would be referred to as an *infinite loop*.

In the next section, we will implement this program that we have planned. Program planning sounds complicated and it is to some degree. When you first start programming, it's often hard to convert our normal thought processes into a procedure that the computer can understand. We often forget the number of "temporary storage locations" that our minds are using to process problems. As you read and write programs, however, this will eventually become very natural to you. Just have patience.