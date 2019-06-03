#!/bin/bash

function install_package() {
	if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
		echo "installing $1\n"
 		apt-get install $1;
	else
		echo "Package already installed: $1"
	fi
}

add-apt-repository ppa:gnome-terminator

sudo apt-get update

install_package "build-essential"
install_package "cmake"
install_package "git"

install_package "terminator"
sudo update-alternatives --config x-terminal-emulator

install_package "vim"
sudo update-alternatives --config editor
