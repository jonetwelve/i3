#!/bin/bash

read -p "New root password: " rootpw
read -p "New user: " newuser
read -p "${newuser}'s password: " userpw
#update os
echo -e "Server = http://mirror.nus.edu.sg/archlinux-arm/\$arch/\$repo\n`cat /etc/pacman.d/mirrorlist`" 
echo -e "Server = http://ftp.tku.edu.tw/Linux/ArchLinux-arm/\$arch/\$repo\n`cat /etc/pacman.d/mirrorlist`" 
echo -e "Server = http://mirrors.hust.edu.cn/archlinux-arm/\$arch/\$repo\n`cat /etc/pacman.d/mirrorlist`" 
echo -e "Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxarm/\$arch/\$repo\n`cat /etc/pacman.d/mirrorlist`" 
echo -e "Server = http://mirrors.ustc.edu.cn/archlinuxarm/\$arch/\$repo\n`cat /etc/pacman.d/mirrorlist`" 

pacman -Syu --noconfirm
pacman -S --noconfirm dialog git zsh sudo base-devel
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
rm -rf /etc/skel/*
echo "autoload -U compinit promptinit" >> /etc/skel/.zshrc
echo "compinit" >> /etc/skel/.zshrc
echo "promptinit" >> /etc/skel/.zshrc
echo "prompt adam2" >> /etc/skel/.zshrc
echo "" >> /etc/skel/.zshrc
echo 'bindkey "\e[1~" beginning-of-line # Home' >> /etc/skel/.zshrc
echo 'bindkey "\e[4~" end-of-line # End' >> /etc/skel/.zshrc
echo 'bindkey "\e[5~" beginning-of-history # PageUp' >> /etc/skel/.zshrc
echo 'bindkey "\e[6~" end-of-history # PageDown' >> /etc/skel/.zshrc
echo 'bindkey "\e[2~" quoted-insert # Ins' >> /etc/skel/.zshrc
echo 'bindkey "\e[3~" delete-char # Del' >> /etc/skel/.zshrc

#root password
(echo $rootpw;sleep 1;echo $rootpw) | passwd > /dev/null
userdel -r alarm
useradd -m -s $(which zsh) $newuser
echo "$newuser ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults:$newuser !authenticate" >> /etc/sudoers
(echo $userpw;sleep 1;echo $userpw) | passwd $newuser > /dev/null

#yaourt
mkdir tmp
cd tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ../..
rm -rf tmp
