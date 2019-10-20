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

    pacstrap /mnt base base-devel linux linux-firmware net-tools

    #set fstab
    echo "make fstab "
    genfstab -U /mnt >> /mnt/etc/fstab

    cp -a ../i3 /mnt/root

    #Chroot
    clear
    echo "/root/${0} to continue"
}


function jconfig(){
	read -p "Input root passwd:" -s rootpwd
    (echo $rootpwd;sleep 1;echo $rootpwd) | passwd > /dev/null

    cp /etc/pacman.conf /etc/pacman.conf.default

    echo "[multilib]" >> /etc/pacman.conf
    echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
    echo "[archlinuxcn]" >> /etc/pacman.conf
    echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf

    pacman -Syy
    pacman -S --noconfirm archlinuxcn-keyring
    pacman -S --noconfirm yaourt powerpill
    sed -i 's/#EDITFILES=1/#EDITFILES=0/g' /etc/yaourtrc
    sed -i 's/#PACMAN="pacman"/PACMAN="powerpill"/g' /etc/yaourtrc

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
    pacman -S --noconfirm alsa-utils chromium compton curl dialog dosfstools epdfview fcitx-configtool fcitx-im
	pacman -S --noconfirm fcitx-sunpinyin firefox gimp git gstreamer0.10-plugins gtk-engines gvfs gvfs-mtp
    pacman -S --noconfirm gvfs-nfs mesa neovim nitrogen ntfs-3g openssh p7zip pcmanfm powerline-fonts
	pacman -S --noconfirm python-pip python-neovim rofi sudo udisks2 unrar unzip volumeicon wget wqy-microhei
	pacman -S --noconfirm xarchiver xf86-input-evdev xf86-video-intel xf86-video-vesa xorg-server xorg-xinit
	pacman -S --noconfirm zip zsh 

    rm -rf /etc/skel/*
    echo 'export GTK_IM_MODULE=fcitx' >> /etc/skel/.xprofile
    echo 'export QT_IM_MODULE=fcitx' >> /etc/skel/.xprofile
    echo 'export XMODIFIERS=@im=fcitx' >> /etc/skel/.xprofile

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
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
    rm -f /etc/localtime
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    echo "make time"
    hwclock --systohc --utc

    #GRUB
    clear
    echo "install and config grub"
    pacman -S --noconfirm grub os-prober
    sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/g' grub

    # display manager
    pacman -S --noconfirm lightdm lightdm-slick-greeter
    sed -i 's/#greeter-session=example-gtk-gnome/lightdm-slick-greeter/g' /etc/lightdm/lightdm.conf

    #network
    clear
    echo "auto start network"
    pacman -S --noconfirm networkmanager networkmanager-openconnect networkmanager-vpnc
    pacman -S --noconfirm networkmanager-openvpn networkmanager-pptp network-manager-applet
    systemctl enable NetworkManager


    #pc name
    clear
    echo "Archlinux" > /etc/hostname

    #new user
    clear
    useradd -m -s /usr/bin/zsh jone
    (echo $rootpwd;sleep 1;echo $rootpwd) | passwd jone > /dev/null

    echo "jone ALL=(ALL) ALL" >> /etc/sudoers
    echo "Defaults:jone      !authenticate" >> /etc/sudoers

    clear
    echo "Install over . "
    echo "Config GRUB:grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg"
    echo "Input exit and umount -R /mnt to reboot"
    exit 0
}



$@
