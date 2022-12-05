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
	"cd: Change your location to a door name or go back with (back)"
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
	"There is only one locked door with a label of B2."
	"There is a (desk) in the middle of the room."
	"There also appears to be a (mirror) that is broken."
	"It reeks of black mold."
)

#Room Vars
switch=false

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
			if [[ $switch == true ]]
			then
				echo "Next room confirmed"
				./roomB2.sh
				exit 0
			else 
				echo "The door appears to be firmly held in place by some metal rods."
				sleep 1
				echo "Maybe you should try looking around the room."
				sleep 1
			fi
		;;
		back)
			echo "Are you sure you want to go back?"
			read -p "You will have to redo the room again. >" goBack
			if [[ $goBack == "yes" ]]
			then
				./room0.sh
			fi
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
	exit 0
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
		sleep 1
		echo "You ponder on why you even tried looking at a broken mirror."
		sleep 1
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
	#Door button
	echo "You see carvings of what appear to be names."
	sleep 1
	echo "You hope these weren't the names of those who came here before you."
	sleep 1
	echo "You notice a faint glow under the desk."
	sleep 1
	echo "It appears to be a switch of some sort."
	read -p "Do you press the switch? (y/n) >" yOrN

	case $yOrN in
		y)
		echo "You hear hydraulics near the B2 door open."
		switch=true
		;;
		n)
		echo "You dissmiss the switch and back away from the desk."
		;;
	esac
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
			exit 0
		;;
		*) 
			echo "Invalid entry."
		;;
	esac
	echo "Press any key to continue"
	read -n 1
	clear
done