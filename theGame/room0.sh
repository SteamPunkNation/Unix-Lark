#!/bin/bash

#Variables
introArray=("(Narrator): Hey you what are you doing here?" "(Narrator): Actually nevermind." "(Narrator): Hey are you busy? Cause I need a favor..." "(Narrator): Could you watch this button for me? I need to use the bathroom." "(Narrator): You just hold on to this and whatever you do" "(Narrator): DON'T" "(Narrator): PRESS" "(Narrator): THE" "(Narrator): BUTTON." "(Narrator): Thanks, I'll be back in a bit." "Press any key to continue")

helpInfo=("Commands:" "ls: Look at your surroundings" "cd: Change your location")

function IntroStory(){
for str in "${introArray[@]}"; do
	echo $str
	sleep 1
done
read -n 1
}

function HelpInfo(){
for str in "${helpInfo[@]}"; do
	echo $str
done
echo ""
}

clear
echo "**Entered room 0**"
IntroStory

clear

echo "Here are some commands you can use. If you're ever stuck type help"
HelpInfo
while [[ $REPLY != 0 ]]; do
read -p "What do you want to do? > " Action
if [[ $Action == "ls" ]]
then
echo "There are two open doors for you to enter"
cat  <<EOF
	Please Select:
	
	1. Left Door 
	2. Right Door
EOF
read -p "[1 or 2] > " selection
case $selection in
	1) echo "Walks to the left door"
		source ./roomA1.sh
		break
	;;
	2) echo "Walks to the right door"
		source ./roomB1.sh
		break
	;;
	help) HelpInfo
	;;
	*) echo "Invalid entry."
	;;
esac
echo "Press any key to continue"
read -n 1
else
	clear
fi

done

