#!/bin/bash

#Variables
room_A3=false

#Color Vars
#Colors can be added but these were just some
#that I thought should be universal 
#with all the rooms
PersonColor="$(tput setaf 6)"
DefaultColor="$(tput setaf 2)"
ImportantColor="$(tput setaf 1)"

#Text Vars
#Help info should be constant if needed change
#It should be changed accross all files.
helpInfo=(
	"Commands:"
	"btn: Press the button"
	"ls: Look at your surroundings"
	"cd: Change your location"
	"inspect: Look closer at certain objects"
	"help: For this list"
	"quit: Quit game"
)
btnPress=(
	"You pressed the button"
	"A small section of the wall opens"
	"An egg shaped robot is placed inside"
	"You hear the robotic voice sounds out \"Activated\" "
	"A red beam shoots from what looks like an eye"
	"The beam searches the room before it lands on you"
	"(robot): There you are"
	"Guns pop out from the side of the tuny robot...you didn't even have time to run"
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"Room is empty"
)
#########################
#Functions
#Again should be constant
function HelpInfo(){
for str in "${helpInfo[@]}"; do
	echo $str
done
echo ""
}

function RoomChange(){
	read -p "Where do you want to go? >" selection
	case $selection in 
		A2)
			if [[ $room_A3 == true ]]
			then
				echo "Next room confirmed"
				./roomA3.sh
				break
			else 
				echo "Door is still locked"
			fi
		;;
		back)
			./roomA1.sh
		;;
		*)
			echo "Not a valid room!"
		;;
	esac
}
function ButtonPressed(){
	for str in "${btnPress[@]}"; do
		echo $str
		sleep 1
	done
	read -p "Press any key to exit"
}

function Inspection(){
	read -p "What do you want to inspect? > " selection
	case $selection in
		desk)
		*)
			echo "Theres nothing special about that"
		;;
	esac
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
echo "**Entered room (A2)**"

while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? > " selection
	case $selection in
		#More cases can be added but it is 
		#recommended to make functions first
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
			break
		;;
		inspect)
			Inspection
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
