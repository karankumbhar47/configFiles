#!/bin/bash

PASS=$(echo "manjaro")
USER=$(echo "user")

expect -c "
spawn sudo su
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"

sudo rm -rf /home/$USER/*
sudo rm -rf /home/$USER/.*
sudo ln -sfr /home/karan47/* /home/$USER/
sudo ln -sfr /home/karan47/.* /home/$USER/

exit



echo "Running system update..."
expect -c "
spawn sudo pacman -Syu --noconfirm
expect -nocase \"password\" {send \"$PASS\r\"; interact}
"


packages=(
  dictd
  xfixcursor
  xorg-fonts-misc
  parted
  steam
  gnome-disk-utility
  libpwquality
  gdu
  netcat
  inotify-tools
  exa
  i3-scratchpad
  ttf-jetbrains-mono-nerd
  alacritty
  rofi
  feh
  snapd
  xorg-xbacklight
  unzip
  code
  mpv
  openjdk-doc
  jre-openjdk
  bat
  bashtop
  polybar
  bluez
  yt-dlp
  pulseaudio-bluetooth
  whatstux
  whatdesk
  solaar
  transmission-gtk
  python-pip
  whatsapp-for-linux
  vert-manager
  qemu
  qemu-full
  qemu-user-static
  bridge-utils
  vde2
  ebtables
  dnsmasq
  openbsd-netcat
  libosinfo-bin
  swtpm
  html2text
  lynx
  pandoc
  gtop
  btop
  ttf-font-awesome
  gnome-calculator
  evtest
  mtpfs
  kdeconnect
  go-mtpfs
  gvfs
  gvfs-mtp
  dictd
  figlet
  aspell
  aspell-n
  xcape
  ttf-jetbrains-mono-nerd 
  html2text 
  lynx 
  pandoc 
  mpv 
  gtop 
  irssi 
  python-pipi 
  ttf-font-awesome 
  evtest 
  xorg-xev
  neovim
  jq
)

for package in "${packages[@]}"; do
  if ! pacman -Qs "$package" >/dev/null; then
    echo "Installing $package..."

    expect -c "
    spawn sudo pacman -S --noconfirm $package
    expect -nocase \"password\" {send \"$PASS\r\"; interact}
	"
  else
    echo "$package is already installed."
  fi
done > temp.txt



set -e

# Create a symbolic link for snapd
expect -c "
spawn sudo ln -s /var/lib/snapd/snap /snapd
expect -nocase \"password\" {send \"$PASS\r\"; interact}
	"

# Enable and start the snapd socket service
expect -c "
spawn sudo systemctl enable --now snapd.socket
expect -nocase \"password\" {send \"$PASS\r\"; interact}
	"


# Install Android Studio using Snap# 
expect -c "
spawn sudo snap install android-studio --classic
expect -nocase \"password\" {send \"$PASS\r\"; interact}
	"

# Install IntelliJ IDEA Community Edition using Snap
expect -c "
spawn sudo snap install intellij-idea-community --classic
expect -nocase \"password\" {send \"$PASS\r\"; interact}
	"

# Install Qalculate using Snap
expect -c "
spawn sudo snap install qalculate
expect -nocase \"password\" {send \"$PASS\r\"; interact}
	"



packagesy=(
  i3-scratchpad-git
  brave-bin
  shell-color-scripts
  whatsapp-linux
  google-chrome
  python-adblockparser
  siji-git
  ttf-unifont
  tgpt
  jmtpfs
)

temp_file="tempname.txt"

for package in "${packagesy[@]}"; do
  echo "Installing $package..."
  if ! yay -Qs "$package" >/dev/null; then
      echo "Installing $package..."
      expect -c "
      spawn yay -S --noconfirm $package
      expect -nocase \"password\" {send \"$PASS\r\"; interact}
          "
  else
      echo "$package is already installed."
      
  fi
done 
