## Addressing Modes

In the Section called *Data Accessing Methods* in Chapter 2, we learned the different types of addressing modes available for use in assembly language.

This section will deal with how those addressing modes are represented in assembly language instructions.

The general form of memory address references is `ADDRESS_OR_OFFSET(%BASE_OR_OFFSET,%INDEX,MULTIPLIER)`. All of the fields are optional. To calculate the address, simply perform the following calculation: `FINAL ADDRESS = ADDRESS_OR_OFFSET + %BASE_OR_OFFSET + MULTIPLIER * INDEX`. Note that:
- Both `ADDRESS_OR_OFFSET` and `MULTIPLIER` must be constants.
- Both `%BASE_OR_OFFSET` and `%INDEX` must be registers.
- Zero substitutes pieces left out.
- *immediate-mode* cannot be represented in this fashion.

### direct-addressing mode
- Loads `%eax` with the given memory address.
- Uses `ADDRESS_OR_OFFSET`
- Ex: `movl ADDRESS, %eax`

### indexed-addressing mode
- Uses `ADDRESS_OR_OFFSET`, `%INDEX`, and a constant multiplier.
- The index register can be any general-purpose one.
- Multipliers of 1, 2, or 4 indexes bytes, double-bytes, and words respectively.
- Ex, to access the third character/byte of `string_start`: 
	- `movl $2, %ecx`
	- `movl string_start(,%ecx,1), %eax`
		- this calculates the address of `string_start` + `%ecx` * 1

### indirect-addressing mode
- Loads a value from the address a register holds unto.
- Ex: `movl (%eax), %ebx`
 
### base pointer-addressing mode
- Loads a value from the address a register holds unto, incremented by a given constant.
- Ex: `movl 4(%eax), %ebx` 

### immediate-mode
- Loads values/constants, prefixed with a dollar sign, directly into registers or memory locations.
- Ex: `movl $12, %eax` 
- Without the prefix, the value located at memory location 12 would be loaded instead.

### register-addressing mode
- Simply moves data in or out of a register.
- Acts as the latter operand in all of the other addressing modes.
 
Immediate mode can only be used as a source operand. The rest can either be a source or destination.

Instructions for moving data of different sizes exist also:
- `movl` moves data a word at a time.
- `movb` moves data a byte at a time.

However, since registers work with words, `movb` must work with portions of full registers.

`%eax` is divided into two pairs of two bytes: ... and `%ax`, the latter being the least-significant half (last part of the number) of `%eax`. 

`%ax` is further divided into `%ah` and `%al`, each holding one byte, the former being the the most significant byte and the latter the least significant. 

Loading a value into `%eax` overrides whatever is in those individual portions. Similarly, loading a value into each of those portions overrides the value of `%eax`.

> *(For a more comprehensive list of instructions, see Appendix B.)*