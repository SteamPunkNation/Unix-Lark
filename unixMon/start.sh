#!/bin/bash
echo"
██    ██ ███    ██ ██ ██   ██               ███    ███  ██████  ███    ██ 
██    ██ ████   ██ ██  ██ ██                ████  ████ ██    ██ ████   ██ 
██    ██ ██ ██  ██ ██   ███       █████     ██ ████ ██ ██    ██ ██ ██  ██ 
██    ██ ██  ██ ██ ██  ██ ██                ██  ██  ██ ██    ██ ██  ██ ██ 
 ██████  ██   ████ ██ ██   ██               ██      ██  ██████  ██   ████
"

echo ""
echo ""
echo "Welcome to Unix-Mon!"
echo "In this Lark game you are a unix-mon researcher working with your grandfather. He approaches you with a question." 

cat << EOF
Grandfather: Hey kiddo do you think you can help me out? I'm currently researching Unix-Mon in the area and was wondering if you would like to catch some for me?

EOF
printf "Do you want to help? Y/n "

read RESP

if [ "$RESP" = "y" -o "$RESP" = "Y" ];
then
cat << EOF
Grandfather: Alright! Let's get you some gear to prepare.
EOF
else
Cat << EOF
Grandfather: Oh okay...
EOF
fi