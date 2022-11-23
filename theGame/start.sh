#!/bin/bash
# set color variables
BG_BLACK="$(tput setab 0)"
FG_GREEN="$(tput setaf 2)"

#Function to reset game variables
function resetVar(){
echo "Resetting Lark envrioment for new game, $userName "
sleep 2
# reset variables here
}


#Save screen
tput smcup

#Display menu until selection == 0
while [[ $REPLY != 0 ]]; do
   echo -n ${BG_BLACK} ${FG_GREEN}
   clear
#cat uses input of a here document
   cat <<EOF
     Welcome to our game!
     Please Select:
     
     1. Start Game
     0. Quit
EOF

#Read statement to position cursor
read -p "Enter selection [1 or 0] > " selection

   #Clear area beneath menu
   tput cup 10 0 #positions the cursor
   echo -n ${BG_BLACK} ${FG_GREEN}
   tput ed #Clears cursor to end of line
   tput cup 11 0

#Act on selection
case $selection in
        1)  echo "Starting Game"
		source ./room0.sh
		break
            ;;
        0)  break
            ;;
        *)  echo "Invalid entry."
            ;;
      esac
      echo "Press any key to continue"
      read -n 1
    done

#Restore saved screen
tput rmcup
echo "Program terminated"
