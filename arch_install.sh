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
    cp /etc/pacman.conf.default /etc/pacman.conf
    pacman -Syy
}


function jbase(){
    dialog --backtitle "Archlinux install script" --clear \
    --title "Description" \
    --yesno "Mount the / to mnt yourseld\n\n\
    Click yes to start install.\nClick no to exit\nClick esc to reboot" 20 90

    respose=$?
    case $respose in
    0)
    ;;
    1)
    exit 1
    ;;
    *)
    reboot;;
    esac

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

    umount -R /mnt
    systemctl reboot
}

function install_software(){
    clear
    if dialog --backtitle "Configure" --title "Install software" \
    --checklist "Click space to select or deselect ,enter to confirm ,click other to cancel" 20 90 20 \
    libreoffice "office" on\
    abiword "office work" off\
    gnumeric "office excel" off\
    adwaita-icon-theme  "" off \
    evince "pdf reader" on\
    faience-icon-theme "icon theme" off\
    fcitx "input method" on\
    fcitx-im "input method" on\
    fcitx-configtool "input method" on\
    fcitx-sunpinyin "input method" on\
    ibus "input method" off\
    ibus-qt "input method" off\
    ibus-pinyin "input method" off\
    deadbeef "music player" on\
	dosfstools "music player" on\
	feh "picture player" on\
	fuse "picture player" on\
    firefox "web brower" on\
	chromium "web brower" on\
    epiphany "web brower" off\
    flashplugin "brower plugin" on\
    gftp "ftp client" off\
    gimp "picture editor" on\
    git "" on\
    gnome-mplayer  "video player" on\
    vlc "video player" off \
    parole "video player" off \
    gnome-screenshot "" off\
    gstreamer0.10-plugins "" on\
    gtk-engines "" on\
    gvfs "" on\
    seahorse "" on\
	gvfs-nfs "" on\
	neovim "" on\
    gvfs-mtp "" on\
    lightdm-gtk-greeter-settings "" on \
    i3 "desktop environment" on\
    lxde "desktop environment" off\
    cinnamon "desktop environment" off\
    deepin "desktop environment" on\
    xfce4 "desktop environment" off\
    mate "desktop environment" off\
    plasma "desktop environment" off\
    gnome "desktop environment" off\
    enlightenment "desktop environment" off\
    cairo-dock "customer desktop-taskbar" off\
    plank "customer desktop-taskbar" off\
    tint2 "customer desktop-taskbar" off\
    awesome "customer desktop-window manager" off\
    lxterminal "customer desktop-terminal emulator" off\
    medit "editor" on\
    network-manager-applet "" on\
    networkmanager-openconnect "" on\
    networkmanager-openvpn "" on\
    networkmanager-pptp "" on\
    networkmanager-vpnc "" on\
    xf86-video-intel "" on\
    xf86-video-ati "" off\
    xf86-video-nouveau "" off\
    ntfs-3g "" on\
    numlockx "" off\
    openssh "" on\
    p7zip "" on\
    php "" on\
    python-pip "" on\
	python-neovim "" on\
	rofi "" on\
    plank "" off\
    scrot "" off\
	shadowsocks-qt5 "" on\
	sakura "" on\
    thunderbird "" off\
    udisks2 "" on\
    unrar "" on\
    unzip "" on\
    virtualbox "" on\
    virtualbox-host-modules "" on\
    xarchiver "" on\
    compton "" on\
    zip "" on\
    2>/tmp/jarch/software.txt
    then
    dialog --backtitle "Configure" --title "Install software" --infobox "ing..." 20 90
    powerpill -S --noconfirm mesa
    powerpill -S --noconfirm wqy-microhei
    powerpill -S --noconfirm ttf-dejavu
    powerpill -S --noconfirm xf86-video-vesa
    powerpill -S --noconfirm xf86-input-evdev
    powerpill -S --noconfirm xorg-xinit
    powerpill -S --noconfirm xorg-server volumeicon
    powerpill -S --noconfirm alsa-utils
    powerpill -S --noconfirm ntfs-3g gvfs
    powerpill -S --noconfirm lightdm lightdm-gtk-greeter
    systemctl enable lightdm
       selections=`cat /tmp/jarch/software.txt`
    for i in $selections ; do
    powerpill -S --noconfirm $i
    done
    fi
}

function jconfig(){
	read -p "Input root passwd:" -s rootpwd
    (echo $rootpwd;sleep 1;echo $rootpwd) | passwd > /dev/null

    mkdir /tmp/jarch
    install_dialog
    install_powerpill
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
    powerpill -S --noconfirm networkmanager
    systemctl enable NetworkManager


    #pc name
    clear
    pcname="Archlinux"

    #new user
	clear
    useradd -m -s /usr/bin/zsh jone
    read -p "Input jone passwd:" -s jonepwd
    (echo $jonepwd;sleep 1;echo $jonepwd) | passwd jone > /dev/null

    powerpill -S --noconfirm sudo
    powerpill -S --noconfirm zsh


    echo "${newuser} ALL=(ALL) ALL" >> /etc/sudoers
    echo "Defaults:${newuser}      !authenticate" >> /etc/sudoers

    #install software
    install_software
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
