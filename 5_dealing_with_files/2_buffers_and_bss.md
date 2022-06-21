# Buffers and `.bss`

A buffer is a continuous block of bytes used for bulk data-transfer. Temporarily, it is both where data read from files are placed or where data to be written to are staged. Later, data from buffers are converted to a form that other programs can handle.

Buffers and file descriptors need not be worked with much. Existing Linux conventions handle most of the complications of file IO.

Reading a single line of text of arbitrary size from a file involves:
- reading a number of character bytes into a buffer
- stopping when the end-of-line character is reached
- copying all of those characters found into a buffer
- using more buffers in case one isn't enough

Any characters left over from a buffer designates the starting point for next time.

Buffers of a fixed size, set by the programmer. Either static or dynamic storage must be reserved to create one, the former declared using `.long` or `.byte` directives, the latter covered in chapter 9.

The `.bss` section is used to reserve unintialized storage like so:
```assembly
.section .bss
    .lcomm my_buffer, 500
```

`.lcomm` creates a symbol, which refers to a 500-byte storage location. If a file has been opened for reading and with the file descriptor put in `%ebx`, the following code example can be done:
```assembly
movl $my_buffer, %ecx
movl 500, %edx
movl 3, %eax
int $0x80
```

Which will read up to 500 bytes into the buffer. `my_buffer` represents the address of the start of our buffer. That address is loaded into `%ecx`.
