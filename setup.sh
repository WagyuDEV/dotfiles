#!/bin/bash

# TODO: Add support for other distros, like arch, gentoo, and void

if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
# elif [ -f /etc/SuSe-release ]; then
#     # Older SuSE/etc.
#     ...
# elif [ -f /etc/redhat-release ]; then
#     # Older Red Hat, CentOS, etc.
#     ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
fi

echo $OS


echo -n "It appears that you are using $OS, is that correct?  (Y/n): "
read right_os
if [[ "$right_os" == "y"* ]] || [[ "$right_os" == "Y"* ]]; then
    right_os=1
else
    right_os=0
fi

if [ "$right_os" = 1 ]; then
    if [ "$OS" = "Fedora Linux"]; then
        sudo dnf install python3 zsh i3 i3blocks lm_sensors acpi rofi
        echo "Installing Oh-My-ZSH"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    elif [ "$OS" = "Debian"] || [ "$OS" = "Ubuntu"]; then
        sudo apt update
        sudo apt upgrade
        sudo apt install python3 zsh i3 i3bocks lm_sensors acpi rofi
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi 
else
    echo "The dependencies you need to install are"
    echo "- python3"
    echo "- zsh"
    echo "- ohmyzsh"
    echo "- i3"
    echo "- i3blocks"
    echo "- lm_sensors"
    echo "- acpi"
    echo "- rofi"
    echo ""
    echo "python3 zsh i3 i3blocks lm_sensors acpi rofi"
    echo ""
    echo "After zsh is installed run"
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi
