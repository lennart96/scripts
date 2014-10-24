#!/bin/sh
for $group in $(cat groups)
do
    sudo gpasswd -a $USER $group
done

sudo pacman -S --needed --no-confirm $(cat pac)
pacaur -S -a --noconfirm --noedit $(cat aur)
