# How Functions Work

Functions are composed of several different pieces:
- Function name - represents the address where its code starts.
- Function parameters - the data items given to the function for processing.
- Local variables - temporary local storage used by a function.
- Static variables - data storage used and reused by functions, not accessible to any other place.
- Global variables - data storage used by a function, but are managed outsude.
- Return address - a parameter used to indicate where execution resumes after the function finishes.
- Return value - the method of transferring data back to the main program.

Different languages have different calling conventions; ways of storing variables and the way parameters and return values are transferred by the computer; basically describing how functions get and receive data when they are called.

Assembly languages and programs can use any calling convention and even make one up, but is required to use that of another language's it wishes to interoperate with.

> *We will use the calling convention of the C programming language for our examples because it is the most widely used, and because it is the standard for Linux platforms.*