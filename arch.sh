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
	pacman -S --noconfirm libreoffice 
	pacman -S --noconfirm chromium 
    pacman -S --noconfirm lightdm
    pacman -S --noconfirm network-manager-applet
	pacman -S --noconfirm gimp 
	pacman -S --noconfirm git 
	pacman -S --noconfirm gstreamer0.10-plugins 
	pacman -S --noconfirm gtk-engines 
	pacman -S --noconfirm gvfs 
	pacman -S --noconfirm gvfs-nfs 
	pacman -S --noconfirm neovim 
	pacman -S --noconfirm gvfs-mtp 
	pacman -S --noconfirm deepin 
	pacman -S --noconfirm evince 
	pacman -S --noconfirm dosfstools  
	pacman -S --noconfirm volumeicon
	pacman -S --noconfirm gvfs
	pacman -S --noconfirm lightdm-gtk-greeter
	pacman -S --noconfirm networkmanager-openconnect
	pacman -S --noconfirm networkmanager-openvpn
	pacman -S --noconfirm networkmanager-pptp 
    pacman -S --noconfirm networkmanager-vpnc
	pacman -S --noconfirm xf86-video-intel
	pacman -S --noconfirm ntfs-3g
	pacman -S --noconfirm openssh
	pacman -S --noconfirm p7zip
	pacman -S --noconfirm python-pip
	pacman -S --noconfirm python-neovim
	pacman -S --noconfirm rofi
	pacman -S --noconfirm sakura
	pacman -S --noconfirm udisks2
	pacman -S --noconfirm unrar
	pacman -S --noconfirm unzip
	pacman -S --noconfirm xarchiver
	pacman -S --noconfirm compton
	pacman -S --noconfirm zip
	pacman -S --noconfirm fish
	pacman -S --noconfirm sudo
	pacman -S --noconfirm firefox-developer-edition
    pacman -S --noconfirm mesa
	pacman -S --noconfirm fcitc
	pacman -S --noconfirm fcitx-im
	pacman -S --noconfirm fcitx-configtool
	pacman -S --noconfirm fcitx-sunpinyin git
    pacman -S --noconfirm wqy-microhei
    pacman -S --noconfirm xf86-video-vesa
    pacman -S --noconfirm xf86-input-evdev
    pacman -S --noconfirm xorg-xinit
    pacman -S --noconfirm xorg-server
    pacman -S --noconfirm alsa-utils
    pacman -S --noconfirm ntfs-3g
    systemctl enable lightdm

    rm -rf /etc/skel/*
    echo 'export GTK_IM_MODULE=fcitx' >> /etc/skel/.zprofile
    echo 'export QT_IM_MODULE=fcitx' >> /etc/skel/.zprofile
    echo 'export XMODIFIERS=@im=fcitx' >> /etc/skel/.zprofile

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
	rm -f /etc/localtime
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
    useradd -m -s /bin/bash jone
    (echo $jonepwd;sleep 1;echo $jonepwd) | passwd jone > /dev/null

    echo "jone ALL=(ALL) ALL" >> /etc/sudoers
    echo "Defaults:jone      !authenticate" >> /etc/sudoers

    systemctl enable lightdm

    clear
    echo "Install over . Input exit and umount -R /mnt to reboot"
    exit 0
}



$@
