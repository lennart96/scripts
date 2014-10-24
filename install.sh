#!/bin/sh
for group in $(cat groups)
do
    sudo gpasswd -a $USER $group
done

sudo pacman -S --needed --noconfirm $(cat pac)
pacaur -S -a --noconfirm --noedit $(cat aur)
