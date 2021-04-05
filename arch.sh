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
    echo "SigLevel = Optional TrustedOnly" >> /etc/pacman.conf
    echo "Server = http://mirrors.163.com/archlinux-cn/\$arch" >> /etc/pacman.conf
    sed -i 's/#Color/Color/g' /etc/pacman.conf
    echo "[archlabs_repo]"
    echo "SigLevel = Optional TrustAll"
    echo "Server = https://bitbucket.org/archlabslinux/\$repo/raw/master/\$arch"
    echo "Server = https://github.com/ARCHLabs/\$repo/raw/master/\$arch"
    echo "Server = https://sourceforge.net/projects/archlabs-repo/files/\$repo/\$arch"

    pacman -Syy
    pacman -S --noconfirm archlinuxcn-keyring
    pacman -S --noconfirm archlabs-keyring

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
    pacman -S --noconfirm curl dialog sudo zsh

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
    pacman -S --noconfirm grub os-prober efibootmgr
    sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/g' /etc/default/grub

    # display manager
    pacman -S --noconfirm lightdm lightdm-slick-greeter
    sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-slick-greeter/g' /etc/lightdm/lightdm.conf

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
    echo "Config GRUB:"
    echo ""
    echo "    grub-install /dev/sda"
    echo "    or efi grub-install --efi-directory=/boot/efi --bootloader-id=grub"
    echo "    grub-mkconfig -o /boot/grub/grub.cfg"
    echo "Input exit and umount -R /mnt to reboot"
    exit 0
}


function jx(){
    pacman -S --noconfirm alsa-utils picom dosfstools epdfview fcitx-configtool fcitx-im
    pacman -S --noconfirm fcitx-libpinyin git gstreamer0.10-plugins gtk-engines gvfs gvfs-mtp
    pacman -S --noconfirm gvfs-nfs mesa neovim nitrogen ntfs-3g openssh p7zip pcmanfm powerline-fonts powerpill
    pacman -S --noconfirm python-pip python-neovim trizen  udisks2 unrar unzip volumeicon wget wqy-microhei
    pacman -S --noconfirm xarchiver xf86-input-evdev xf86-video-intel xf86-video-vesa xorg-server xorg-xinit zip

    sed -i 's/#EDITFILES=1/EDITFILES=1/g' /etc/pacman.conf
    sed -i 's/#PACMAN="pacman"/PACMAN="powerpill"/g' /etc/pacman.conf
}



function hlp(){
    echo "mount device help"
    echo  'parted /dev/disk mklabel msdos'
    echo  'parted /dev/disk mkpart primary ext4 1M 300G'
    echo  'parted /dev/disk mkpart primary linux-swap 300G 100%'
    echo ''
    echo  'parted /dev/disk mklabel gpt'
    echo  'parted /dev/disk mkpart primary 1M 512M '
    echo  'parted /dev/disk mkpart primary ext4 512M 300G'
    echo  'parted /dev/disk mkpart primary linux-swap 300G 100%'
    echo  'mkfs.vfat /dev/disk1'
    echo  'mkfs.ext4 /dev/disk2'
    echo 'mount /dev/disk1 /mnt'
    echo 'mkdir -p /mnt/boot/efi && mount /dev/disk2 /mnt/boot/efi'
}

if [[ $# < 1 ]]; then
    hlp
else
    $@
fi
