#!/bin/bash
# set color variables
BG_BLACK="$(tput setab 0)"
FG_GREEN="$(tput setaf 2)"
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

function Start(){
    echo "Loading Game..."
    sleep 1
    echo "Press any key to continue"
    read -n 1
    #Start of the actual room
    clear
    echo "**Entered room (0)**"
    #IntroStory
    clear
    echo "Here are some commands you can use. If you're ever stuck type 'help'"
    HelpInfo
    ./room0.sh
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
        1)  
        Start
        break
        ;;
        0)  
        break
        ;;
        *)  
        echo "Invalid entry."
        ;;
      esac
      echo "Press any key to continue"
      read -n 1
done

#Restore saved screen
tput rmcup
echo "Alt+F4'ed"
