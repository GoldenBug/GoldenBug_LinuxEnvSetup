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

if [ "$EUID" -ne 0 ]
  then echo "This probably won't succeed if not run as root ¯\\_(ツ)_/¯"
  read -p "Press enter to continue anyway..."
fi

add-apt-repository ppa:gnome-terminator

apt-get update

install_package "build-essential"
install_package "cmake"
install_package "terminator"
install_package "vim"
install_package "git"
