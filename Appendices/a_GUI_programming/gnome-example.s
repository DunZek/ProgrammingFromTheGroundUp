/* A program to illustrate how GUI programs look like written with GNOME libraries in assembly.

The user can only click on the "Quit" button or close the window.

All the application can do is quit.

If the user clicks on the "Quit" button, the program will display a dialog asking if they are sure. If they click Yes, it will close the application. Otherwise, it will continue running. */

.section .data
/* GNOME definitions:
These are found in GNOME header files for the C language, converted into their assembly equivalents. */
GNOME_STOCK_BUTTON_YES:
    .ascii "Button_Yes\0"
GNOME_STOCK_BUTTON_NO:
    .ascii "Button_No\0"

# GNOME MessageBox Types:
GNOME_MESSAGEBOX_QUESTION:
    .ascii "question\0"

# Standard definition of NULL:
.equ NULL, 0

# GNOME signal definitions:
signal_destroy:
    .ascii "destroy\0"
signal_delete_event:
    .ascii "delete_event\0"
signal_clicked:
    .ascii "clicked\0"

# Application-specific definitions:
app_id:
    .ascii "gnome-example\0"
app_version:
    .ascii "1.000\0"
app_title:
    .ascii "GNOME Example Program\0"

# Text for buttons and windows:
button_quit_text:
    .ascii "I Want to Quit the GNOME Example Program\0"
quit_question:
    .ascii "Are you sure you want to quit?\0"

.section .bss
# 

.section .text

