# The UNIX File Concept

Linux employs the UNIX way of doing files; opening a file of data by name as a sequential stream of bytes. A *file descriptor* is provided throughout the operation, which is used to read and write to the file.

In our programs, we will deal with files in the following ways:
1. Use the `open` system call to provide a filename, a number to represent the mode of use, and a permission set as its parameters:
    - `%eax` holds the system call number.
    - `%ebx` holds the address of the first character of the filename.
    - `%ecx` holds read/write intentions, represented as a number:
        - `0` is designated to read.
        - `03101` is designated to write.
    - `%edx` holds a number to set the permission:
        - `0666` for `rw-rw-rw-`

2. The kernel returns a file descriptor in `%eax`, a number that refers to the file throughout the program.

3. Do reads and writes, each time providing the kernel the file descriptor. Furthermore,

`read` is system call 3 requiring:
- the file descriptor in `%ebx`,
- the address of a buffer for storing data in `%ecx` and,
- the size of the buffer in `%edx`.

and returning with either:
- the number of characters read from the file or,
- an error code (a negative integer).

`write` is system call 4, requiring the same parameters as `read` with the buffer already having data to write out. It returns with the number of bytes or an error code written to `%eax`.

4. Afterwards, telling the kernel to close the file using `close` (system call 6) by passing it the file descriptor (placed in `%ebx`), rendering it invalid later.

