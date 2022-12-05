#!/bin/bash

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
	"cd: Change your location to a door name or go back with (back)"
	"cat: Inspects items, anything in () is the name you should enter."
	"help: For this list"
	"quit: Quit game"
)
btnPress=(
	"Upon pressing the suspicious glowing button the narrator gave you a cold breeze is felt."
	"You look foward and see horrors beyond your comprehension."
	"You body freezes due to the thought of you dying soon."
	"You are [REDACTED] to death by [REDACTED] and are never spoken of again."
	"${ImportantColor}Game Over${DefaultColor}"
)
lookAround=(
	"Upon looking around you notice somethings."
	"The walls are covered in a faded greenish-yellow wallpaper."
	"There appears to be a few fluorescent lights hangning on the ceiling."
	"The lights have a electrical buzzing melody with them."
	"There is a singular wall (outlet) with its outer casing hanging on barely."
	"There is a light (switch) where the door behind you used to be."
)
lookAroundInTheDark=(
	"Upon looking around in the dark you notice something coming from the wall outlet."
	"There appears to be a faint glow coming from it."
	"There also appears to be a (keyhole) on the floor beneath you."
)

#Room vars
lightsOn=true
previousDoor=false
nextDoor=false
outlet=true
key=false

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
		B3)
			if [[ $nextDoor == true ]]
			then
				./roomB3.sh
				exit 0
			else
				echo "Door? What door?"
			fi
		;;
		back)
			if [[ $nextDoor == true ]]
			then
				echo "Are you sure you want to go back?"
				read -p "You will have to redo the room again. >" goBack
				if [[ $goBack == "yes" ]]
				then
					./roomB1.sh
				fi
			else
				echo "Door? What door?"
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

function LookAroundInTheDark(){
	for str in "${lookAroundInTheDark[@]}"; do
		echo $str
		sleep 1
	done
}

function Inspect(){
	read -p "What do you want to inspect? >" inspectedObject
	case $inspectedObject in
		outlet)
			if [[ $lightsOn == false ]]
			then
				if [[ $outlet == true ]]
				then
					echo "Upon getting closer to the outlet you decide to rip it off the wall."
					sleep 1
					echo "There appears to be a key where a electrical outlet should be."
					sleep 1
					echo "You decide to take the key."
					key=true
					outlet=false
				else
					echo "You already took the key, there is nothing else to do here."
				fi
			else
				echo "There is nothing to do here."
			fi
		;;
		switch)
			if [[ $lightsOn == true ]]
			then
				echo "You decide to turn the lights off."
				lightsOn=false
			else
				echo "You decide to turn the lights on."
				lightsOn=true
			fi
		;;
		keyhole)
			if [[ $lightsOn == false ]]
			then
				if [[ $key == true ]]
				then
					echo "The lights flicker and the door to go back appears."
					sleep 1
					echo "The lights flicker once more and a trapdoor with the label B3"
					echo "appears where the keyhole used to be."
					previousDoor=true
					nextDoor=true
				else
					echo "There is nothing to do here."
				fi
			else
				echo "Keyhole? What keyhole?"
			fi
		;;
		*)
		echo "Invalid entry."
		;;
	esac
}
#########################
#Start of the actual room
clear
echo "**Entered room (B2)**"
sleep 1
echo "Upon entering the room you notice the door behind you has disappeared."
sleep 1

while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? >" selection
	case $selection in
		ls)
			if [[ $lightsOn == true ]]
			then
				LookAround
			else
				LookAroundInTheDark
			fi
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