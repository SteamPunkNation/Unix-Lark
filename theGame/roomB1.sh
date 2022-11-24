#!/bin/bash

#Variables

#Color Vars
PersonColor="$(tput setaf 6)"
DefaultColor="$(tput setaf 2)"
ImportantColor="$(tput setaf 1)"

#Text Vars
helpInfo=(
	"Commands:"
	"btn: Press the button"
	"ls: Look at your surroundings"
	"cd: Change your location"
	"help: For this list"
	"quit: Quit game"
)
btnPress=(
	"Upon pressing the button you notice blood leaking through the seams of the walls."
	"The room fills with blood from the floor to the ceiling."
	"You drown in the room of blood and are never seen again."
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"Upon looking around you notice a few things."
	"There is only one locked door."
	"There is a desk in the middle of the room."
	"There also appears to be a mirror that is broken."
	"It reeks of black mold."
)


#########################
#Functions
function HelpInfo(){
for str in "${helpInfo[@]}"; do
	echo $str
done
echo ""
}

function RoomChange(){
	read -p "Where do you want to go? >" selection
	case $selection in 
		B2)
			echo "Next room confirmed"
			break
		;;
		back)
			./room0.sh
			break
		;;
		*)
			echo "Not a valid room!"
		;;
	esac
}
function ButtonPressed(){
	#This should be changed every room to make the
	#button's interactions be unique

	for str in "${btnPress[@]}"; do
		echo $str
		sleep 1
	done
	read -p "Press any key to exit"
	break
}
#Should be constant
function LookAround(){
	for str in "${lookAround[@]}"; do
		echo $str
		sleep 1
	done
}
#########################
#Start of the actual room
clear
echo "**Entered room (B1)**"

while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? >" selection
	case $selection in
		ls)
			LookAround
		;;
		help) 
			HelpInfo
		;;
		cd) 
			RoomChange
		;;
		btn)
			ButtonPressed
		;;
		quit)
			break
		;;
		*) 
			echo "Invalid entry."
		;;
	esac
	echo "Press any key to continue"
	read -n 1
	clear
done