#!/bin/bash
function install_dialog(){
    is_dialog_install=`pacman -Qi dialog 2> /dev/null`
    #install dialog if not install
    if [ -z "$is_dialog_install" ]
    then
        pacman -S --noconfirm dialog
    fi
}

function install_powerpill(){
    cp /etc/pacman.conf /etc/pacman.conf.default

    echo "[archlinuxcn]" >> /etc/pacman.conf
    echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf
    echo "Server = http://repo.archlinuxcn.org/\$arch" >> /etc/pacman.conf

    pacman -Syy
    pacman -S --noconfirm archlinuxcn-keyring
    pacman -S --noconfirm yaourt
    echo 1 | yaourt --noconfirm powerpill

    rm -rf /etc/pacman.conf
    mv /etc/pacman.conf.default /etc/pacman.conf
    pacman -Syy
}


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
    genfstab -p /mnt >> /mnt/etc/fstab

    cp -a ${0} /mnt/root

    #Chroot
    clear
    echo "/root/${0} to continue"
    arch-chroot /mnt
}

function install_software(){
	powerpill -S --noconfirm libreoffice adwaita-icon-theme evince faience-icon-theme deadbeef dosfstools  \
	chromium gimp git gstreamer0.10-plugins gtk-engines gvfs gvfs-nfs neovim gvfs-mtp i3 deepin \
    network-manager-applet networkmanager-openconnect networkmanager-openvpn networkmanager-pptp \
    networkmanager-vpnc xf86-video-intel ntfs-3g openssh p7zip python-pip python-neovim rofi plank \
	sakura udisks2 unrar unzip xarchiver compton zip zsh sudo 
    powerpill -S --noconfirm mesa fcitc fcitx-im fcitx-configtool fcitx-sunpinyin
    powerpill -S --noconfirm wqy-microhei
    powerpill -S --noconfirm xf86-video-vesa
    powerpill -S --noconfirm xf86-input-evdev
    powerpill -S --noconfirm xorg-xinit
    powerpill -S --noconfirm xorg-server volumeicon
    powerpill -S --noconfirm alsa-utils
    powerpill -S --noconfirm ntfs-3g gvfs
    powerpill -S --noconfirm lightdm lightdm-gtk-greeter
    systemctl enable lightdm

    rm -rf /etc/skel/*
    echo 'export GTK_IM_MODULE=fcitx' >> /etc/skel/.zprofile
    echo 'export QT_IM_MODULE=fcitx' >> /etc/skel/.zprofile
    echo 'export XMODIFIERS=@im=fcitx' >> /etc/skel/.zprofile
}

function jconfig(){
	read -p "Input root passwd:" -s rootpwd
    (echo $rootpwd;sleep 1;echo $rootpwd) | passwd > /dev/null
    read -p "Input jone passwd:" -s jonepwd

    mkdir /tmp/jarch
    install_powerpil
    install_software
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
    powerpill -S --noconfirm grub
    grub-install /dev/sda
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



if [ -z $1 ]
then
    dialog_install=`pacman -Qi dialog 2> /dev/null`
    if [ -z "$dialog_install" ]
    then
        jconfig
    else
        jbase
    fi
else
    $@
fi
