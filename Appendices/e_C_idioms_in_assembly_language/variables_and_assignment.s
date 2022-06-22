/*  Variables and Assognment:

    In C:

    int my_global_var;

    int foo() {
        int my_local_var;

        my_local_var = 1;
        my_global_var = 2;

        return 0;
    }

    To implement in assembly:
*/
.section .data
.lcomm my_global_var, 4

.type foo, @function
foo:
    push $rbp
    mov %rsp, %rbp
    sub $8, %sp     # Make 
    .equ my_local_var, -8

    mov $1, my_local_var(%rbp)
    mov $2, my_global_var

    # Clean up function + return to caller:
    mov %rbp, %rsp
    pop $rbp
    ret


