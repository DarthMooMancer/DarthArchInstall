#!/bin/bash

cd ~/
yes | sudo rm -rd Darthi3wmdotfiles plymouth-themes
yes | sudo rm -rf /var/lib/pacman/db.lck

echo "Updating"
echo ""
yes | sudo pacman -Syu

echo ""
echo "Installing Main Packages"
echo ""
yes | sudo pacman -S firefox ly ranger htop plymouth xorg-server

echo ""
echo "Cloning and Setting up Github repository for Plymouth "
echo ""

git clone https://github.com/adi1090x/plymouth-themes.git
cd ~/plymouth-themes/pack_2
yes | sudo cp -r deus_ex /usr/share/plymouth/themes/

yes | sudo plymouth-set-default-theme -l

yes | sudo plymouth-set-default-theme -R deus_ex

cd ~/

yes | sudo rm -rd ~/plymouth-themes

echo ""
echo "Setting up Display Environment"
echo ""

yes | sudo systemctl enable ly 

echo ""
echo "Cloning and Setting up i3wm"
echo "" 

git clone https://github.com/DarthMooMancer/Darthi3wmdotfiles.git
cd Darthi3wmdotfiles
./install.sh

echo ""
echo "Installing YAY"
echo ""

cd ~/
yes | sudo rm -rd ~/Darthi3wmdotfiles
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo ""
echo "Installing Sublime Text"
echo ""

cd ~/
yes | sudo rm -rd yay
yes | yay -S sublime-text-4

echo ""
echo "Finished! Please reboot me, by typing <sudo reboot>"
echo "Keybinds on my github: https://github.com/DarthMooMancer/DarthArchInstall"



