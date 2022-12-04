#!/bin/bash

#Variables
room_A5=false
Black=false
Blue=false
Red=false
Green=false


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
	"Nothing happened"
	"***ONE WEEK LATER***"
	"You died of dysentery"
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"Walls are painted a dark black"
	"The floor is a bright white"
	"The (door) across from you says \"A5\""
	"On the wall to the left there are 4 (lights) of all different colors"
	"Next to the lights is a (note)"
)
Note=(
	"Wow i can't believe you made it this far"
	"Great Job!"
	"This is room is really simple because you already have the answer"
	"In room A2 you were told to remeber the colors of the shapes"
	"All you have to do is turn on the lights in the same order that the shapes were entered in"
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
		A5)
			if [[ $room_A5 == true ]]
			then
				echo "Next room confirmed"
				./roomA5.sh
			else 
				echo "Door is still locked"
			fi
		;;
		A4)
			read -p "You will have to restart the room. Are you sure you want to go back? (yes / no)" choice
			if [[ $choice == yes ]]
			then
				./roomA4.sh
			fi
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
		lights)
			echo "There are 4 lights, red, green, blue, and black"
			read -p "Which light do you want to look at? > " temp
			case $temp in
				green) echo "There is a swith under it"
					read -p "Do you want to flick it? (yes or no) > " choice
					if [[ $choice == yes && $Red == true && $Blue == true && $Black == true ]]
					then 
						echo "You flicked the switch and the light turned on"
						echo "The lights all start flashing"
						room_A5=true
						echo "There was a click at the door" 
					elif [[ $choice == yes ]]
					then
						echo "Wrong order"
						echo "All the lights turned off"
						Red=false
						Blue=false
						Black=false
					fi
				;;
				red) echo "There is a switch under it"
					read -p "Do you want to flick it? (yes or no) > " choice
					if [[ $choice == yes && $Blue == true && $Black == true ]]
					then 
						echo "You flicked the switch and the light turned on"
						Red=true
					elif [[ $choice == yes ]]
					then
						echo "Wrong order"
						echo "All the lights turned off"
						Red=false
						Blue=false
						Black=false
					fi
				;;
				blue) echo "There is a switch under it"
					read -p "Do you want to flick it? (yes or no) > " choice
					if [[ $choice == yes && $Black == true ]]
					then 
						echo "You flicked the switch and the light turned on"
						Blue=true
					elif [[ $choice == yes ]] 
					then 
						echo "Wrong Order"
						echo "All the lights turned off"
						Red=false
						Blue=false
						Black=false
					fi
				;;
				black) echo "There is a switch under it"
					read -p "Do you want to flick it? (yes or no) > " choice
					if [[ $choice == yes ]]
					then
						echo "You flicked the switch and the light turned on"
						Black=true
					fi
				;;
				*) 
					echo "Thats not an option"
				;;
			esac
		;;
		note)
			for str in "${Note[@]}"; do
				echo $str
				sleep 1
			done
		;;
		door)
			if [[ $room_A5 == false ]]
			then
				echo "The door is still locked"
			else
				echo "The door is open"
			fi
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
echo "**Entered room (A4)**"

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
			exit 0
		;;
		cat)
			Inspection
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
