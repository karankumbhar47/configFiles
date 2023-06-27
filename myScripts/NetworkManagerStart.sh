#!/bin/bash

PASS="karan47"

expect -c "
spawn sudo systemctl unmask NetworkManager  
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"
 
expect -c "
spawn  sudo systemctl start NetworkManager      
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"

expect -c "
spawn  sudo systemctl enable NetworkManager 
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"

