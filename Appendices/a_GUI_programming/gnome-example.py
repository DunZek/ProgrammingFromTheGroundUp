"""This program is meant to be an example of what GUI programs look like written with the GNOME libraries."""
import gtk
import gnome.ui


def destroy_handler(event):
    gtk.mainquit()
    return 0


def delete_handler(window, event):
    return 0


def click_handler(event):
    msgbox = gnome.ui.GnomeMessageBox(
        "Are you sure you want to quit?",
        gnome.ui.MESSAGE_BOX_QUESTION,
        gnome.ui.STOCK_BUTTON_YES,
        gnome.ui.STOCK_BUTTON_NO)
    msgbox.set_modal(1)
    msgbox.show()

    result = msgbox.run_and_close()
    if (result == 0):
        gtk.mainquit()

    return 0


# Create new application window:
app = gnome.ui.GnomeApp("gnome-example", "GNOME Example Program")

# Create a button + show it:
button = gtk.GtkButton("I want to quit the GNOME Example Program")
app.set_contents(button)
button.show()

# Show application window:
app.show()

# Connect signal handlers:
app.connect('delete_event', delete_handler)
app.connect('destroy', destroy_handler)
button.connect('clicked', click_handler)

# Transfer control to GNOME:
gtk.mainloop()
