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
	"cat: Inspects items, anything in () is the name you should enter."
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
	"There is a (desk) in the middle of the room."
	"There also appears to be a (mirror) that is broken."
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
##############################
#May be added to room template
function Inspect(){
	read -p "What do you want to inspect? >" inspectedObject
	case $inspectedObject in
		mirror)
		echo "You look into the mirror and only see multiple reflections of yourself."
		echo "You ponder on why you even tried looking at a broken mirror."
		;;
		desk)
		InspectDesk
		;;
		*)
		echo "Invalid entry."
		;;
	esac
}
function InspectDesk(){
	$roomKey = $(gawk '{print $1}' ./player.inv)
	if [ $roomKey == "RoomKey_B1" ]
	then
		echo "There is nothing else to do here."
	else
		echo "You recieved a room key!"
		echo "RoomKey_B1" > ./player.inv
	fi
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
		cat)
			Inspect
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