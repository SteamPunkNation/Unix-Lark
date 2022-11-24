#!/bin/bash
#########################
#Variables

#Color Vars
PersonColor="$(tput setaf 6)"
DefaultColor="$(tput setaf 2)"
ImportantColor="$(tput setaf 1)"

#Text Vars
introArray=(
	"${PersonColor}(Narrator): Hey you what are you doing here?"
	"(Narrator): Actually nevermind."
	"(Narrator): Hey are you busy? Cause I need a favor..."
	"(Narrator): Could you watch this button for me? I need to use the bathroom."
	"(Narrator): You just hold on to this and whatever you do"
	"${PersonColor}(Narrator): ${ImportantColor}DON'T"
	"${PersonColor}(Narrator): ${ImportantColor}PRESS"
	"${PersonColor}(Narrator): ${ImportantColor}THE"
	"${PersonColor}(Narrator): ${ImportantColor}BUTTON."
	"${PersonColor}(Narrator): Thanks, I'll be back in a bit."
	"${DefaultColor}Press any key to continue"
)
helpInfo=(
	"Commands:"
	"btn: Press the button"
	"ls: Look around your surroundings"
	"cd: Change your location Ex: 'cd A1'"
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

function IntroStory(){
for str in "${introArray[@]}"; do
	echo $str
	sleep 1
done
read -n 1
clear
}

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
			break
		;;
		B1)
			./roomB1.sh
			break
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
sleep 3
IntroStory
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
