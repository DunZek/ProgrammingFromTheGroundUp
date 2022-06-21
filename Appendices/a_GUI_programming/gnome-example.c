/**
 * @file gnome-example.c
 * @author your name (you@domain.com)
 * @brief This program is meant to be an example of what GUI progams look like written with the GNOME libraries.
 * @version 0.1
 * @date 2022-06-21
 * 
 * @copyright Copyright (c) 2022
 * 
 */
#include <gnome.h>

// Program definitions:
#define APP_TITLE "GNOME Example Program"
#define APP_ID "gnome-example"
#define APP_VERSION "1.000"
#define BUTTON_TEXT "I Want to Quit the Example Program"
#define QUIT_QUESTION "Are you sure you want to quit?"

// Prototypes:
int destroy_handler(gpointer window, GdkEventAny *e, gpointer data);
int delete_handler(gpointer window, GdkEventAny *e, gpointer data);
int click_handler(gpointer window, GdkEventAny *e, gpointer data);

int main(int argc, char **argv) {
    gpointer aggPtr;  // app window
    gpointer btnQuit;  // quit button

    // Initialize GNOME libraries:
    gnome_init(APP_ID, APP_VERSION, argc, argv);

    // Create new app window:
    appPtr = gnome_app_new(APP_ID, APP_TITLE);

    // Create new button:
    btnQuit = gtk_button_new_with_label(BUTTON_TEXT);

    // Make the button show up inside the app window:
    gnome_app_set_contents(appPtr, btnQuit);

    // Make the button show up:
    gtk_widget_show(btnQuit);

    // Make the application window show up:
    gtk_widget_show(appPtr);

    // Connect the signal handlers:
    gtk_signal_connect(
        appPtr, 
        "delete_event", 
        GTK_SIGNAL_FUNC(delete_handler),
        NULL
    );
    gtk_signal_connect(
        
    );

}

