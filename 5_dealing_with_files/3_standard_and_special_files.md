# Standard and Special Files
Linux programs usually have at least three open file descriptors when they begin:

## `STDIN`
File descriptor 0 is *standard input*, which is a read-only file that usually represents the computer keyboard. 

## `STDOUT`
File descriptor 1 is *standard output*, which is a write-only file that usually represents the screen display.

## `STDERR`
File descriptor 2 is *standard error*, which is a write-only file that usually represents the screen display. `STDERR` serves to split error messages from normal output going through `STDOUT`.

Any of these files can be redirected from or to another file. Programs don't need to know the differences amongst these files and normal ones.

In UNIX, many of the files you'll be using might not even be normal files:
- input/output systems
- network connections
- serial posrts
- audio devices
- communication media between processes (pipes)

Some of these have different methods of opening and creation compared to regular files (like using the `open` system call). But, the standard `read` and `write` system calls can still be used with them.
