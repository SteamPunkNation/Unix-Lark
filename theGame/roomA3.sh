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
<<<<<<< HEAD
=======

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
>>>>>>> parent of 017a472 (Revert "Update roomA3.sh")
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
<<<<<<< HEAD
echo "**Entered room (#)**"

while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? >" selection
	case $selection in
		#More cases can be added but it is 
		#recommended to make functions first then
		#add cases to make it look cleaner and
		#easier to read
=======
echo "**Entered room (A3)**"

while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? > " selection
	case $selection in
		#More cases can be added but it is 
		#recommended to make functions first
>>>>>>> parent of 017a472 (Revert "Update roomA3.sh")
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
<<<<<<< HEAD
			#In most cases I believe pushing the button
			#should make it so the game ends
			#but you can remove the break cmd
			#if you choose so
			ButtonPressed
			break
		;;
		quit)
			break
=======
			ButtonPressed
			exit 0
		;;
		cat)
			Inspection
		;;
		quit)
			exit 0
>>>>>>> parent of 017a472 (Revert "Update roomA3.sh")
		;;
		*) 
			echo "Invalid entry."
		;;
	esac
	echo "Press any key to continue"
	read -n 1
	clear
<<<<<<< HEAD
done
=======
done
>>>>>>> parent of 017a472 (Revert "Update roomA3.sh")
