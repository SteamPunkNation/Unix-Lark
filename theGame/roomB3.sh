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
	"cd: Change your location"
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
	"There is nothing in the room but a (door) labeled B3."
	"On the door is a circular object cut into fours."
	"Each section on the object has four different colors."
	"Green, Red, Yellow, and Blue."
	"Each of the four colors glow simultaneously in a breathing pattern."
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

function Inspect(){
	read -p "What do you want to inspect? >" inspectedObject
	case $inspectedObject in
		door)
			simonStart
		;;
		*)
			echo "Invalid entry."
		;;
	esac
}
#########################
#Simon color game
function simonStart(){
	#Rules of simon
	echo "Rules:"
	echo "All you have to do is enter the colors in order."
	echo "For example if the color is red when this '>' is shown type your color and press enter."
	echo "Each color should be entered seperately."
	echo "If you enter all colors correctly the order will be repeated with one more color."
	echo "Once you enter a wrong color the game is over."
	echo "You win simon gives up."

	read -p "Ready to start? (y/n)> " startGame
	if [[ $startGame == "y" ]]
	then
		simonGame
	else
		echo "You decided to back away from the door."
	fi
}
function simonGameColorPicker(){
	randNum=$((1 + $RANDOM % 4))
	case $randNum in
		1)
			echo "green"
		;;
		2)
			echo "red"
		;;
		3)
			echo "yellow"
		;;
		4)
			echo "blue"
		;;
	esac
}
function simonGameMain(){
	currentPatttern=()
	playerCount=0
	#Get 10 random colors
	for i in {1..10};
	do
		local color=$(simonGameColorPicker)
		currentPatttern+=($color)
	done

	#Main game
	for n in {1..10};
	do
		playerCount=$((playerCount + 1))
		for j in $playerCount
		do
			#List current pattern
			for listPattern in $playerCount
			do
				echo ${currentPatttern[listPattern]}
			done

			#get input
			read -p "Enter Color > " playerColor
			if [[ $playerColor != ${currentPatttern[j]} ]]
			then
				echo "Incorrect Color!"
				echo "Exiting game!"
				break
			fi
		done
	done
	echo "You win!"



}
#########################
#Start of the actual room
while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? >" selection
	case $selection in
		test)
			simonGameMain
		;;
		#DELETE ABOVE CASE USED FOR TESTING
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