#!/bin/bash
#########################
#Variables
PersonColor="$(tput setaf 6)"
DefaultColor="$(tput setaf 2)"
ImportantColor="$(tput setaf 1)"

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
	"The circular four segmented object on the door glows red."
	"${PersonColor}(Simon Says) Simon says you're done for."
	"${DefaultColor} You lost the game and therefore your life."
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"There is nothing in the room but a door labeled B3."
	"On the door is a circular (lock) cut into fours."
	"Each section on the object has four different colors."
	"Green, Red, Yellow, and Blue."
	"Each of the four colors glow simultaneously in a breathing pattern."
	"There is also a sticky (note) to the left of the lock."
)
note=(
	"The note contains some chicken scratch which was hard to read but you believe it says..."
	"${ImportantColor} The sky during mid-day."
	"Avacado insides."
	"Top light in a traffic light."
	"Wet floor sign."
	"Stop sign"
	"McDonalds Arches"
	"Florida Poly main color"
	"Snow"
	"${DefaultColor}(Hint: the only colors you should get are Red, Blue, Green, Yellow, Purple, White)"
	"(Hint: For the puzzle in this room you just need the color inital with capitalization)"
)

#Room vars
nextRoom=false

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
		B4)
			if [[ $nextRoom == true ]]
			then
				./roomB4.sh
				exit 0
			else
				echo "The door is locked with some circular four colored device."
			fi
			;;
		back)
			echo "Are you sure you want to go back?"
			read -p "You will have to redo the room again. >" goBack
			if [[ $goBack == "yes" ]]
			then
				./roomB2.sh
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
}
#Should be constant
function LookAround(){
	for str in "${lookAround[@]}"; do
		echo $str
		sleep 1
	done
}

function noteScript(){
	for str in "${note[@]}"; do
		echo $str
		sleep 1
	done
}

function lockFunction(){
	echo "Enter your code like this example 'WGBR' note this is not the answer."
	read -p "What is the code? >" colorCode
	if [[ $colorCode == "BGRYRYPW" ]]
	then
		nextRoom=true
		echo "Correct code!"
		echo "Door now unlocking."
	else
		echo "Incorrect code!"
	fi
}

function Inspect(){
	read -p "What do you want to inspect? >" inspectedObject
	case $inspectedObject in
		note)
			noteScript
		;;
		lock)
			lockFunction
		;;
		*)
			echo "Invalid entry."
		;;
	esac
}

#########################
#Start of the actual room
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