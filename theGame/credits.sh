#!/bin/bash

credits=(
	"Congrats you made it to the end!"
	"We both thank you for playing our game and hope you had fun"
	"and that you learned something."
	""
	"We both had lots of fun making this game"
	"even though we struggled a bit with making it entertaining and coming up with unique ideas for each room."
	""
	"If there were any bugs you found while playing please let contact one of us and we can try to fix it"
	""
)
clear
for str in "${credits[@]}"; do
	echo $str
	sleep 1
done
read -p "Press key to exit"
echo "Thank you for not pressing the button"
sleep 2
exit 0
