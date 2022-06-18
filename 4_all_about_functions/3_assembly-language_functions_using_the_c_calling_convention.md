# Assembly-Language Functions using the C Calling Convention

Computer programs use the *stack*, a region of memory that stores data and maintains the last stacked data available first.

It lives at the very top addresses of memory. An instruction, `pushl` can be used to push values from either a register or a memory location on top.

The top of the stack is located at the "bottom" of the stack because the stack actually begins at the end of the line of memory addresses, which is then directed to the start.

`popl` can be used to remove values on top of the stack to place it into a register or memory location.

The stack can continually grow further down in memory until it trespasses other territories of memory. The stack register, `%esp`, always contains a pointer to the current top of the stack. 

Using `pushl` and `popl` respectively subtracts 4 from and adds 4 to `%esp`, as a word of data gets pushed unto or popped from the stack. Each take one operand: the register or memory location to push onto the stack (`pushl`) or to receive the data that is popped from it (`popl`).

We can directly use the `%esp` register in indirect addressing mode to access a value on top of the stack, like so:
```assembly
movl (%esp), %eax
```

To access the value right below the top of the stack, use base pointer addressing mode:
```assembly
movl 4(%esp), %eax
```

In C's calling convention, the stack is used to implement a function's local variables, parameters, and return address:
1. Upon compilation, a program pushed all of the parameters of a function onto the stack in reverse order they were defined in.
2. To execute a function, a `call` instruction is issued with the function it wishes to start, doing two things in order:
    1. It pushes the address of the next instruction, the return address onto the stack.
    2. It then modifies the `%eip` pointer to point to the start of the function.

When the function starts, the stack would look like so, with its top at the bottom:
```
Parameter #N
...
Parameter 2
Parameter 1
Return Address <-- (%esp)
```

When the function starts running:
3. It saves the current base pointer register, `%ebp`, a special register used for accessing function parameters and local variables by doing `pushl %ebp`.
4. It copies the stack pointer to `%ebp` by doing `movl %esp, %ebp` so that function parameters can be accessed later as fixed indexes from the base pointer. This is done because the stack will still be used for other reasons, so the stack pointer won't be available.

Doing so allows us to know where our parameters and local variables are while the stack continues to be used. `%ebp` will always be where the stack pointer was at the beginning of the function, acting as a constant reference to the *stack frame*, which consists of all the stack variables used within a function, including parameters, local variables and return address).

The stack looks like this now. Each parameter can be accessed using base pointer addressing with the `%ebp` register:

```
Parameter #N   <-- N*4 + 4(%ebp)
...
Parameter 2    <-- 12(%ebp)
Parameter 1    <-- 8(%ebp)
Return Address <-- 4(%ebp)
Old %ebp       <-- (%esp) and (%ebp)
```

5. The function reserves space on the stack for any local variables it uses. This is done by moving the stack pointer out of the way, and for two words of memory, then down two words to reserve space for them:

```assembly
subl $8, %esp
```

With two words for local storage, the stack now looks like this, exemplifying a function and its frame in the stack:
```
Parameter #N     <--- N*4 + 4(%ebp)
...
Parameter 2      <--- 12(%ebp)
Parameter 1      <--- 8(%ebp)
Return Address   <--- 4(%ebp)
Old %ebp         <--- (%ebp)
Local Variable 1 <--- -4(%ebp)
Local Variable 2 <--- -8(%ebp) and (%esp)
```

Using different offsets with `%ebp`, we can access all the data we need from that function. `%ebp` was designed specifically for this purpose (hence why it is called *base pointer*). Other registers can be used, but within the x86 architecture, it is designed most performantly.

Global and static variables are accessed exactly as how memory is, the latter only being used by a single function while the former by many. However, both are treated exactly the same in Assembly languages.

When a function is done executing:
1. It stores its return value in `%eax`.
2. It resets the stack to before it was called (pops the current stack frame off, revealing that of the calling code).
3. It returns control back to wherever it was called from using the `ret` instruction, which pops a value from the stack and sets the instruction pointer `%eip` to that value.

...

```assembly
movl %ebp, %esp
popl $ebp
ret
```

At this point, consider all local variables to be disposed of.


## Destruction of Registers

### Extended Specification