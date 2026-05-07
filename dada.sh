#!/bin/bash

set -e #exit at problems
sudo -v #sudo for entie install time
while true; do sudo -v; sleep 60; done &
unlimitedsudo=$!

echo "WE SHALL BEGIN" #quick info for user

sudo pacman -S --needed --noconfirm git base-devel #needed commands

sudo sed -i '/#\[multilib]/,/Include/s/^#//' /etc/pacman.conf #deletes # in multilib (req for steam install)

sudo pacman -Syu #update the system

if ! command -v paru &>/dev/null; then #install paru when not found
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
cd
fi

paru -S --noconfirm steam heroic-games-launcher-bin spotify-launcher discord firefox #install programs

kill $unlimitedsudo #kills sudo without password session

echo "THAT IS ALL" #quick info for user
