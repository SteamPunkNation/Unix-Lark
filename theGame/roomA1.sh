#!/bin/bash

#Variables
room_A2=false

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
	"A giant save icon appears in the middle of the room"
	"The room goes black as the simulation powers down"
	"You realize you're just a NPC"
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"Room is bare with a single light and a desk"
	"A label A2 is shown on top of the door"
	"Next to the door is a keypad"
)
deskinfo=(
	"The desk is small with a bunch of sticky notes on it"
	"The sticky notes all have random pictures but you can easily disipher 3 of them,"
	"a boy having cake in his favority pizzaria, the banner above him has a big 5 on it,"
	"a picture of the button but with DONT PRESS written 3 times,"
	"and a mysterious 4 legged animal...i wonder what it is"
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
			if [[ $room_A2 == true ]]
			then
				echo "Next room confirmed"
				./roomA2.sh
				break
			else 
				echo "Door is still locked"
			fi
		;;
		back)
			echo "The door behind you is shut tight"
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
			for str in "${deskinfo[@]}"; do
				echo $str
				sleep 1
			done
		;;
		keypad)
			read -p "Enter the 4 digit code here > " selection
			if [[ $selection == 3534 ]]
			then
				echo "You hear a slight click"
				room_A2=true
			else
				echo "Wrong code"
			fi
		;;
		light)
			echo "Did you really just try to inspect a light?"
		;;
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
echo "**Entered room (A1)**"

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
