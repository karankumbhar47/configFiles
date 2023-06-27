#!/bin/bash

serviceName=$2
action=$1

PASS=$(echo "karan47")

case "$action" in
  "en")
    expect -c "
    spawn sudo systemctl enable $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  "d")
    expect -c "
    spawn sudo systemctl disable $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  "s")
    expect -c "
    spawn sudo systemctl start $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  "re")
    expect -c "
    spawn sudo systemctl restart $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  "st")
    expect -c "
    spawn sudo systemctl stop $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  "m")
    expect -c "
    spawn sudo systemctl mask $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  "um")
    expect -c "
    spawn sudo systemctl unmask $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  "stat")
    expect -c "
    spawn systemctl status $serviceName
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
    "
    ;;
  *) echo "Invalid action"
    ;;
esac
