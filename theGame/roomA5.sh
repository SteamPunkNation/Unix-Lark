#!/bin/bash

A5=(
	"What are you still doing here?"
	"That's it"
	"Go home"
	""
	""
	""
	""
	"There is nothing else"
	"Shoo"
	""
	""
	""
	"Well i guess i could give you something else"
	"Here, i'll give you an option"
	"You've only played half of this game"
	"One timeline"
	"There are still more puzzles made by someone much more smarter than me"
	"Maybe his puzzles will challege you"
	"or you can go right to the credits and be done"
	"You're choice"
)
clear
for str in "${A5[@]}"; do
	echo $str
	sleep 1
done
while [[ $REPLY != 0 ]]; do
	read -p "What do you want to do? (credits / continue) " choice
	if [[ $choice == continue ]]
	then
		echo "Good luck"
		sleep 2
		./roomB1.sh
		exit 0
	elif [[ $choice == credits ]]
	then
		./credits.sh
	else
		echo "come on i know you can choose one of the two choices"
	fi
done
