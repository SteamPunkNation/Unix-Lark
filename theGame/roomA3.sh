#!/bin/bash

#Variables
room_A4=false
BTN_NUM=0


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
	"cat: used to inspect items"
	"help: For this list"
	"quit: Quit game"
)
btnPress=(
	"Button was pressed."
	"Really?"
	"I give you a perfectly safe button to press and you choose to push the one you're not suppoed to push?"
	"Nah"
	"Nah"
	"Nah"
	"You deserve to restart"
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"You stand in a brightly lit room"
	"Across from you is a tightly shut (door)"
	"The room is painted white and the entire room just seems clean"
	"The only bit of color is a bright red (button) in the middle of the room"
	"Under the button is a note"
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
		A4)
			if [[ $room_A4 == true ]]
			then
				./roomA4.sh
				exit 0
			else
				echo "The door is still locked. Try cating more things"
			fi
		;;
		A2)
			read -p "You will have to restart this room. Are you sure you want to go back? (yes / no) " choice
			if [[ $choice == yes ]]
			then
				./roomA2.sh
				exit 0
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
		button)
			echo "The big button taunts you"
			read -p "Do you want to press the button? (yes / no) " choice
			if [[ $choice == yes ]]
			then
				while [[ $BTN_NUM -le 4 ]]
				do
					BTN_NUM=$((BTN_NUM + 1))
					echo "You pushed the button and it felt amazing"
					read -p "wanna do it again? " choice
					if [[ $choice == yes ]]
					then
						continue
					else
						break
					fi
				done
			fi
			if [[ $BTN_NUM == 5 ]]
			then
				room_A4=true
				echo "The door is unlocked"
				sleep 1
				echo "I hope that helped"
			fi
		;;
		door)
			echo "There is a note that reads A4"
			if [[ $room_A4 == true ]]
			then
				echo "The door is unlocked"
			else
				echo "The door is locked, try inspecting other things in the room"
			fi
		;;
		note)
			echo "Congrats!! You've made it halfway through my rooms"
			sleep 1
			echo "I know it's been tempting to push the button"
			sleep 1
			echo "I wonder how many lifes you've lived to make it here"
			sleep 1
			echo "Here is a big button to press to get all your temptations out"
			sleep 1
		;;
		*)
			echo "Theres nothing special about that"
		;;
	esac
}

function LookAround(){
	for str in "${lookAround[@]}"; do
		echo $str
		sleep 1
	done
}


#########################
#Start of the actual room
clear
echo "**Entered room (A3)**"

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
		btn)
			ButtonPressed
			break
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
