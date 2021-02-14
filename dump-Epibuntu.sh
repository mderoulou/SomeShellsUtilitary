#!/bin/bash
clear
echo "INSTALLING PACKAGES FOR EPITECH'S DUMP"
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
cat /etc/os-release | grep "Ubuntu 18.04.5 LTS"
if [[ $? -ne 0 ]]; then
    echo "This script must be run onto Ubuntu 18.04.5 LTS";
    exit 1
fi
echo "Press ENTER to continue..."
read

echo "Installing apt packages..."
packages_list=( curl
                cmake
                wget
                git
                gcc
                g++
                make
                nasm
                libncurses5-dev
                libsfml-dev
                tcsh
                valgrind
                tree
                zip
                zsh
               )
apt install ${packages_list[@]}

echo "Installing criterion..."
add-apt-repository ppa:snaipewastaken/ppa
apt-get install criterion-dev

echo "Building csmfl..."
./build_csfml.sh