#!/bin/bash

PASS=$(echo "karan47")


expect -c "
spawn sudo systemctl mask bluetooth
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"
 

expect -c "
spawn sudo systemctl mask NetworkManager 
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"


sleep 3

echo "shutdown now"
