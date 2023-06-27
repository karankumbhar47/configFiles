#!/bin/bash

PASS=$(echo "karan47")

expect -c "
spawn sudo systemctl unmask bluetooth
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"
 
expect -c "
spawn sudo systemctl start bluetooth 
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"

expect -c "
spawn  sudo systemctl enable bluetooth
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"

