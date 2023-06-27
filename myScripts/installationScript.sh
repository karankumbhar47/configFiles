#!/bin/bash

#define path
userName="karank"
Pathi3="~/.config/i3/config"


#To install i3-scratchpad 
yay -S --noconfirm i3-scratchpad-git brave-bin shell-color-scripts whatsapp-linux google-chrome
sudo pacman -S ttf-jetbrains-mono-nerd html2text lynx pandoc mpv gtop irssi
sudo snap install android-studio --classic
sudo pacman -S rofi feh
sudo pacman -S bashtop
sudo pacman -S neovim
sudo pacman -S code
sudo pacman -S unzip
sudo pacman -S bat
sudo pacman -S transmission-gtk
sudo pacman -S polybar yt-dlp
sudo pacman -S jq
sudo pacman -S whatsdesk
#this will solve bluetooth error of arch 
#just install pulseaudio-bluetooth and reboot pc
sudo pacman -S pulseaudio-bluetooth


#installing intelljidea
sudo pacman -Syyu -y
sudo pacman -S snapd -y
sudo systemctl enable --now snapd.socket -y
sudo ln -s /var/lib/snapd/snap /snapd
snap version
sudo snap install intellij-idea-community -–classic

#creating symlinks
ln -sf /home/karan47/.myScripts /home/$userName/
ln -sf /home/karan47/.config/i3/ /home/$userName/.config/
ln -sf /home/karan47/.config/ranger/ /home/$userName/.config/
ln -sf /home/karan47/.config/qutebrowser/ /home/$userName/.config/
ln -sf /home/karan47/.config/mpv/ /home/$userName/.config/
ln -sf /home/karan47/.bashrc /home/$userName/
ln -sf /home/karan47/.config/alacritty/ /home/$userName/.config/alacritty
ln -sf /home/karan47/* /home/$userName/


# change vlc keybindings
# install pip 
# install vm
# install whatsdesk
# install opera
# natural scrolling in /etc/X11/xorg.conf.d/30-touchpad.conf
#     Section "InputClass"
#         Identifier "touchpad"
#         Driver "libinput"
#         MatchIsTouchpad "on"
#         Option "Tapping" "on"
#         Option "NaturalScrolling" "true"
#     EndSection
