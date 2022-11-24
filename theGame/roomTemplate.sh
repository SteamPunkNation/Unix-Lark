#!/bin/bash

#NOTE FOR TESTING DIRECTLY ./roomTemplate.sh
#THIS WILL NOT MAKE THE CONSOLE GREEN BY DEFAULT
#YOU WILL NEED TO MAKE SURE IT WORKS WITH THE FIRST
#ROOM AS TO NOT BREAK THE GAME
#########################
#Variables

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
	"help: For this list"
	"quit: Quit game"
)
btnPress=(
	"Button was pressed."
	"${ImportantColor}Game Over${DefaultColor}"
	#Change this to your fitting
	#or don't use it at all
	#recommended to keep game over if btn in 
	#your case ends the game
)
lookAround=(
	"Room is empty."
	#Fill this section with how you want to
	#describe the room and it's surrounding
	#objects that you can interact with.
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
		Z1)
			#This can be changed
			echo "Next room confirmed"
			#THIS MUST BE ADDED AS TO QUIT THE ENTIRE
			#GAME OR ELSE IT LOOPS BACK TO PREVIOUS
			#SCRIPT
			break
		;;
		#You should also make it so the play can go back
		#a room when you add more options in this
		#function
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
#########################
#Start of the actual room
clear
echo "**Entered room (#)**"

while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? >" selection
	case $selection in
		#More cases can be added but it is 
		#recommended to make functions first then
		#add cases to make it look cleaner and
		#easier to read
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
			#In most cases I believe pushing the button
			#should make it so the game ends
			#but you can remove the break cmd
			#if you choose so
			ButtonPressed
			break
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