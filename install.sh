#!/bin/bash

cd ~/
sudo rm -rd Darthi3wmdotfiles plymouth-themes
sudo rm -rf /var/lib/pacman/db.lck

echo "Updating"
echo ""
sudo pacman -Syu

echo ""
echo "Installing Main Packages"
echo ""
sudo pacman -S firefox ly ranger htop plymouth xorg-server

echo ""
echo "Cloning and Setting up Github repository for Plymouth "
echo ""

git clone https://github.com/adi1090x/plymouth-themes.git
cd ~/plymouth-themes/pack_2
sudo cp -r deus_ex /usr/share/plymouth/themes/

sudo plymouth-set-default-theme -l

sudo plymouth-set-default-theme -R deus_ex

cd ~/

sudo rm -rd ~/plymouth-themes

echo ""
echo "Setting up Display Environment"
echo ""

sudo systemctl enable ly 

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
sudo rm -rd ~/Darthi3wmdotfiles
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo ""
echo "Installing Sublime Text"
echo ""

cd ~/
sudo rm -rd yay
yay -S sublime-text-4

echo ""
echo "Changing Grub"
echo ""

sudo sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT=.*\)"$/\1 splash"/' /etc/default/grub
sudo sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT=.*\)"$/\1 quiet"/' /etc/default/grub

echo ""
echo "Finished! Please reboot me, by typing <sudo reboot>"
echo "Keybinds on my github: https://github.com/DarthMooMancer/DarthArchInstall"



