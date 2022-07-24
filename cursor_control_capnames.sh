#!/bin/bash

# we can modify our previous script (sigwinch_signal.sh) to use cursor positioning and to place the window dimensions in the center as the terminal is resized:

#########################################

# term_size3 - Dynamically display terminal window size with text centringn


redraw() {
	local str width height length

	width=$(tput cols)
	height=$(tput lines)
	str="Hello, I am Rohit Raj, I am a Youtuber."
	#str="Width = $width Height = $height"

#We can use the # operator to get the length of the string in BASH, we need to enclose the variable name enclosed in “{ }” and inside of that, we use the # to get the length of the string variable. Thus, using the “#” operator in BASH, we can get the length of the string variable.
	length=${#str} 
	clear
	tput cup $((height / 2)) $(((width / 2) - (length / 2)))
	echo "$str"
}

trap redraw WINCH

redraw
while true; do
	:
done

#########################################

#As in the previous script (sigwinch_signal.sh) , we set a trap for the SIGWINCH signal and start an infinite loop.  The redraw function in this script is a bit more complicated, since it has to calculate the center if the terminal window each time its size changes.#
