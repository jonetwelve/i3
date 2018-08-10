#!/bin/bash

function jbase(){
    #add packages source
    if [ -f "/etc/pacman.d/mirrorlist" ]
    then
        mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.default
    fi

    echo "Server = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
    echo "Server = http://mirror.bit.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.163.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.sohu.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.yun-idc.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://ftp.sjtu.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.4.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirror.lzu.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "update packages"
    pacman -Syy

    pacstrap /mnt base base-devel

    #set fstab
    echo "make fstab "
    genfstab -U /mnt >> /mnt/etc/fstab

    cp -a ${0} /mnt/root

    #Chroot
    clear
    echo "/root/${0} to continue"
    arch-chroot /mnt
}


function jconfig(){
	read -p "Input root passwd:" -s rootpwd
    (echo $rootpwd;sleep 1;echo $rootpwd) | passwd > /dev/null
    read -p "Input jone passwd:" -s jonepwd

    cp /etc/pacman.conf /etc/pacman.conf.default

    echo "[archlinuxcn]" >> /etc/pacman.conf
    echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf
    echo "Server = http://repo.archlinuxcn.org/\$arch" >> /etc/pacman.conf

    pacman -Syy
    pacman -S --noconfirm yaourt 

    rm -rf /etc/pacman.conf
    mv /etc/pacman.conf.default /etc/pacman.conf
    echo "Server = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
    echo "Server = http://mirror.bit.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.163.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.sohu.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.yun-idc.com/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://ftp.sjtu.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirrors.4.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "Server = http://mirror.lzu.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist
    echo "update packages"
    pacman -Syy
	pacman -S --noconfirm libreoffice adwaita-icon-theme evince faience-icon-theme deadbeef dosfstools  
	pacman -S --noconfirm chromium gimp git gstreamer0.10-plugins gtk-engines gvfs gvfs-nfs neovim gvfs-mtp deepin 
    pacman -S --noconfirm network-manager-applet networkmanager-openconnect networkmanager-openvpn networkmanager-pptp 
    pacman -S --noconfirm networkmanager-vpnc xf86-video-intel ntfs-3g openssh p7zip python-pip python-neovim rofi plank 
	pacman -S --noconfirm sakura udisks2 unrar unzip xarchiver compton zip zsh sudo firefox-developer-edition
    pacman -S --noconfirm mesa fcitc fcitx-im fcitx-configtool fcitx-sunpinyin git
    pacman -S --noconfirm wqy-microhei
    pacman -S --noconfirm xf86-video-vesa
    pacman -S --noconfirm xf86-input-evdev
    pacman -S --noconfirm xorg-xinit
    pacman -S --noconfirm xorg-server volumeicon
    pacman -S --noconfirm alsa-utils
    pacman -S --noconfirm ntfs-3g gvfs
    pacman -S --noconfirm lightdm lightdm-gtk-greeter
    systemctl enable lightdm

    rm -rf /etc/skel/*
    echo 'export GTK_IM_MODULE=fcitx' >> /etc/skel/.zprofile
    echo 'export QT_IM_MODULE=fcitx' >> /etc/skel/.zprofile
    echo 'export XMODIFIERS=@im=fcitx' >> /etc/skel/.zprofile

    mkdir /tmp/jarch
    #init
    clear
    mkinitcpio -p linux

    #locale
    clear
    echo "locale-gen"
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
    echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
    locale-gen
    echo "make language "
    echo "en_US.UTF-8 UTF-8" > /etc/locale.conf
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    echo "make time"
    hwclock --systohc --utc

    #GRUB
    clear
    echo "install and config grub"
    pacman -S --noconfirm grub  efibootmgr
	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
    grub-mkconfig -o /boot/grub/grub.cfg

    #network
    clear
    echo "auto start network"
    pacman -S --noconfirm networkmanager
    systemctl enable NetworkManager


    #pc name
    clear
	echo "Archlinux" > /etc/hostname

    #new user
	clear
    useradd -m -s /usr/bin/zsh jone
    (echo $jonepwd;sleep 1;echo $jonepwd) | passwd jone > /dev/null

    echo "jone ALL=(ALL) ALL" >> /etc/sudoers
    echo "Defaults:jone      !authenticate" >> /etc/sudoers

    systemctl enable lightdm

    clear
    echo "Delete something"
    rm -rf /tmp/jarch
    pacman -Rscn --noconfirm dialog

    clear
    echo "Install over . Input exit and click enter to reboot"
    exit 0
}



$@
