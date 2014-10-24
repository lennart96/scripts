#!/bin/sh
sudo -v

# keep sudo rights
while true
do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2> /dev/null &

for group in $(cat groups)
do
    sudo gpasswd -a $USER $group
done
sudo pacman -S --needed --noconfirm zsh
sudo chsh -s /usr/bin/zsh lennart
sudo pacman -S --needed --noconfirm $(cat pac)
pacaur -S -a --noconfirm --noedit --insecure $(cat aur)
