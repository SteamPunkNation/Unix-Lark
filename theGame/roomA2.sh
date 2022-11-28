#!/bin/bash

#Variables
room_A3=false
Triangle=false
Square=false
Pentagon=false
Octogon=false


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
	"cat: Inspects items, anything in () is the name you should enter."
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
	"Guns pop out from the side of the tiny robot...you didn't even have time to run"
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"Room is bare but a lot more coloful than the previous rooms"
	"Straight ahead there is a door with \"A3\" written on it"
	"On the walls there are four (pictures) each with a different shape"
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
		A3)
			if [[ $room_A3 == true ]]
			then
				echo "Next room confirmed"
				./roomA3.sh
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
		pictures)
			echo "There are 4 pictures, a (triangle), a (square), a (pentagon), and an (octogon)"
			read -p "Which picture do you want to look at? > " temp
			case $temp in
				triangle) echo "The triangle is green, there is a button under it"
					read -p "Do you want to push it? (yes or no) > " choice
					if [[ $choice == yes && $Square == true && $Pentagon == true && $Octogon == true ]]
					then 
						echo "You pushed the button"
						room_A3=true
						echo "There was a click at the door"
					elif [[ $choice == yes ]]
					then
						Square=false
						Pentagon=false
						Octogon=false
					fi
				;;
				square) echo "The square is red, there is a button under it"
					read -p "Do you want to push it? (yes or no) > " choice
					if [[ $choice == yes && $Pentagon == true && $Octogon == true ]]
					then 
						echo "You pushed the button"
						Square=true
					elif [[ $choice == yes ]]
					then
						Square=false
						Pentagon=false
						Octogon=false
					fi
				;;
				pentagon) echo "The pentagon is blue, there is a button under it"
					read -p "Do you want to push it? (yes or no) > " choice
					if [[ $choice == yes && $Octogon == true ]]
					then 
						echo "You pushed the button"
						Pentagon=true
					elif [[ $choice == yes ]] 
					then 
						Square=false
						Pentagon=false
						Octogon=false
					fi
				;;
				octogon) echo "The octogon is black, there is a button under it"
					read -p "Do you want to push it? (yes or no) > " choice
					if [[ $choice == yes ]]
					then
						echo "You pushed the button"
						Octogon=true
					fi
				;;
				*) 
					echo "Thats not an option"
				;;
			esac
		;;
		door)
			echo "There is a note that reads A3, under it ther is small writing"
			echo "\"Did you try going from greatest to least?\""
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
			break
		;;
		btn)
			ButtonPressed
			break
		;;
		cat)
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
