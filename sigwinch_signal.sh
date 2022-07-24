#!/bin/bash

#One intresting feature we can use in our script is the SIGWINCH signal. This signal is sent each time the terminal window is resized. We can include a signal handler (i.e., trap) in our script to detect this signal and act upon it:
#############################################
# term_size2 - Dynamically display terminal window size

redraw() {
    clear
    echo "Width = $(tput cols) Height = $(tput lines)"
}

trap redraw WINCH

redraw
while true; do
    :
done

#########################################

#with this script, we start an empty infinite loop, but since we set a trap for the SIGWINCH signal, each time the terminal window is resized the trap is triggered and the new terminal size is displayed. To exit this script, we press ctrl+c
