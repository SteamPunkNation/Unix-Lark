#!/bin/bash
#########################
#Variables

#Color Vars
PersonColor="$(tput setaf 6)"
DefaultColor="$(tput setaf 2)"
ImportantColor="$(tput setaf 1)"

#Text Vars
helpInfo=(
	"Commands:"
	"btn: Press the button"
	"ls: Look around your surroundings"
	"cd: Change your location Ex: 'cd A1'"
	"cat: Inspects items, anything in () is the name you should enter."
	"help: List availible commands"
	"quit: Quit game"
)
btnPress=(
	"You feel your mind going numb..."
	"${PersonColor}(Narrator): I told you not to press it"
	"${DefaultColor}You pass out and are never seen again..."
	"${ImportantColor}GAME OVER${DefaultColor}"
)
lookAround=(
	"There are two open doors for you to enter."
	"One has a label with A1 and another with B1."
	"There appears to be no door to leave this place."
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
		A1)
			./roomA1.sh
			exit 0
		;;
		B1)
			./roomB1.sh
			exit 0
		;;
		back)
			echo "There is no going back!"
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
}

function LookAround(){
	for str in "${lookAround[@]}"; do
		echo $str
		sleep 1
	done
}
#########################
#Start of the room
while [[ $REPLY != 0 ]]; do
read -p "What do you want to do? > " selection
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
		echo "There is currently nothing to inspect!"
	;;
	btn)
		ButtonPressed
		exit 0
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
