#!/bin/bash

#Variables

function IntroStory(){
	sleep 1
	echo "Narrator: **cleaning up room** "
	sleep 1
	echo "Narrator: Where did I put the button....WHERE IS IT"
	sleep 1
	echo "Player: **Stands in doorway like an idiot** "
	sleep 1
	echo "Player: **Sees a weird red button on the floor and picks it up**"
	sleep 1
	echo "yada yada random bullshit"
	sleep 1
	echo "Feel free to look around"
	sleep 1
}

echo "**Entered room 0**"
IntroStory
while [[ $REPLY != 0 ]]; do
clear
read -p "What do you want to do? > " Action
if [[ $Action == "ls" ]]
then
echo "There are two open doors for you to enter"
cat  <<EOF
	Please Select:
	
	1. Left Door
	2. Roght Door
EOF
read -p "[1 or 2] > " selection
case $selection in
	1) echo "Walks to the left door"
		source ./room1.sh
		break
	;;
	2) echo "Walks to the right door"
		source ./room2.sh
		break
	;;
	*) echo "Invalid entry."
	;;
esac
echo "Press any key to continue"
read -n 1
fi
else
	echo "Narrator: Remeber to use ls to look around"
fi

done

