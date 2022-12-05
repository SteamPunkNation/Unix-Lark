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
	"cd: Change your location to a door name or go back with (back)"
	"cat: Inspects items, anything in () is the name you should enter."
	"help: For this list"
	"quit: Quit game"
)
btnPress=(
	"You couldn't wait even once at the end huh?"
	"Pathetic.."
	"${ImportantColor}YOU DIED${DefaultColor}"
	#Change this to your fitting
	#or don't use it at all
	#recommended to keep game over if btn in 
	#your case ends the game
)
lookAround=(
	"There's no point looking around anymore."
	"Just listen to the narrator on the (intercom) and answer his questions."
	#Fill this section with how you want to
	#describe the room and it's surrounding
	#objects that you can interact with.
)
intercom=(
	"${PersonColor}(Narrator) Wow im surprised you've made it this far?"
	"(Narrator) How did I know? I was in your walls."
	"(Narrator) Just kidding! I just used the secret cameras built-in each door."
	"(Narrator) Anyways this is the final room. Behind this final door is perhaps freedom or something else?"
	"(Narrator) You won't know until you beat this final challenge!"
	"(Narrator) This last challenge will be hosted by yours truly."
	"(Narrator) It's a quiz based on the commands you have used so far in your journey."
	"(Narrator) To begin just inspect (quiz) to start!"
	"${DefaultColor}"

)

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
		B5)
			if [[ nextRoom = false ]]
			then
				echo "Not so fast, you have to do something else first."
			else
				echo "Goodbye player!"
				read -p "Press any key to continue..."
				./credits.sh
				exit 0
			fi
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

function Inspect(){
	read -p "What do you want to inspect? >" inspectedObject
	case $inspectedObject in
		intercom)
			intercomScript
		;;
		quiz)
			Quiz
		;;
		*)
			echo "Invalid entry."
		;;
	esac
}
function intercomScript(){
	for str in "${intercom[@]}"; do
		echo $str
		sleep 1
	done
}
function Quiz(){
	wrongAns=false
	while [[ $wrongAns = false ]]; do
		echo "Here's a warning, if you mess up one time you'll have to start the quiz all over again."
		#Q1
		read -p "Q1: What command allowed you to start this quiz? >" q1ans
		if [[ $q1ans != "cat" ]]
		then
			echo "Sorry wrong answer!"
			wrongAns=true
		fi
		#Q2
		read -p "Q2: What command is used to change rooms? >" q2ans
		if [[ $q2ans != "cd" ]]
		then
			echo "Sorry wrong answer!"
			wrongAns=true
		fi
		#Q3
		read -p "Q3: What command is used to list the availible commands? >" q3ans
		if [[ $q3ans != "help" ]]
		then
			echo "Sorry wrong answer!"
			wrongAns=true
		fi
		#Q4
		read -p "Q4: What command is used to look around the current room? >" q4ans
		if [[ $q4ans != "ls" ]]
		then
			echo "Sorry wrong answer!"
			wrongAns=true
		fi
		#Q5
		read -p "Q5: What command will close this lark game? >" q5ans
		if [[ $q5ans != "quit" ]]
		then
			echo "Sorry wrong answer!"
			wrongAns=true
		fi
		#Q6
		read -p "Final Question: What command should NEVER be entered in this lark game? >" q6ans
		if [[ $q6ans != "btn" ]]
		then
			echo "Sorry wrong answer!"
			wrongAns=true
		fi
		echo "Congrats you've passed the quiz and even learned a thing or two about Unix!"
		echo "You may now cd out of here with cd then B5."
		nextRoom=true
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
		cat)
			Inspect
		;;
		btn)
			#In most cases I believe pushing the button
			#should make it so the game ends
			#but you can remove the break cmd
			#if you choose so
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