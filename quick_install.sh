#!/bin/bash
function install_powerpill(){
    cp /etc/pacman.conf /etc/pacman.conf.default

    echo "[archlinuxcn]" >> /etc/pacman.conf
    echo "Server = http://repo.archlinuxcn.org/\$arch" >> /etc/pacman.conf

    pacman -Syy
    pacman -S --noconfirm archlinuxcn-keyring
    pacman -S --noconfirm yaourt
    pacman -S --noconfirm powerpill

    rm -rf /etc/pacman.conf
    cp /etc/pacman.conf.default /etc/pacman.conf
    pacman -Syy
}
function jbase(){
    dialog --backtitle "Archlinux quicklly install script" --clear \
        --title "Description" \
        --yesno "By default: Please mount the disk by yourself
            Click yes to start install.
            Click no to exit
            Click esc to reboot" 20 90

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

    echo "copy usr"
    cp -a /usr /mnt
    echo "copy bin"
    cp -a /bin /mnt
    echo "copy lib"
    cp -a /lib /mnt
    echo "copy lib64"
    cp -a /lib64 /mnt
    echo "copy sbin"
    cp -a /sbin /mnt
    echo "copy etc"
    cp -a /etc /mnt
    echo "copy home"
    cp -a /home /mnt
    echo "copy opt"
    cp -a /opt /mnt
    echo "copy root"
    cp -a /root /mnt
    echo "copy srv"
    cp -a /srv /mnt
    echo "copy var"
    cp -a /var /mnt

    echo "mkdir boot"
    mkdir -vm755 /mnt/boot
    echo "mkdir dev"
    mkdir -vm755 /mnt/dev
    echo "mkdir run"
    mkdir -vm755 /mnt/run
    echo "mkdir mnt"
    mkdir -vm755 /mnt/mnt
    echo "cp vmlinuz-linux "
    cp -vaT /run/archiso/bootmnt/arch/boot/$(uname -m)/vmlinuz /mnt/boot/vmlinuz-linux
    echo "mkdir /mnt/tmp"
    mkdir -vm1777 /mnt/tmp
    echo "mkdir /mnt/sys"
    mkdir -vm555 /mnt/sys
    echo "mkdir /mnt/proc"
    mkdir -vm555 /mnt/proc

    #set fstab
    echo "make fstab "
    genfstab -U /mnt >> /mnt/etc/fstab

    cp -a ${0} /mnt/root

    #Chroot
    clear
    echo "/root/${0} jconfig to continue"
    arch-chroot /mnt

    umount -R /mnt
    systemctl reboot
}
function install_software(){
    install_powerpill

    powerpill -S --noconfirm alsa-utils compton curl dosfstools epdfview fcitx-configtool fcitx-im
	powerpill -S --noconfirm fcitx-sunpinyin firefox gimp git gstreamer0.10-plugins gtk-engines gvfs gvfs-mtp
    powerpill -S --noconfirm gvfs-nfs libreoffice mesa neovim nitrogen ntfs-3g openssh p7zip pcmanfm powerline-fonts
	powerpill -S --noconfirm python-pip python-neovim rofi sudo udisks2 unrar unzip volumeicon wget wqy-microhei
	powerpill -S --noconfirm xarchiver xf86-input-evdev xf86-video-intel xf86-video-vesa xorg-server xorg-xinit
	powerpill -S --noconfirm zip zsh 
    powerpill -S --noconfirm networkmanager networkmanager-openconnect networkmanager-vpnc
    powerpill -S --noconfirm networkmanager-openvpn networkmanager-pptp network-manager-applet
}
function jconfig(){
#add packages source
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.default
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

echo "rebuild log"
sed -i "s/Storage=volatile/#Storage=auto/" /etc/systemd/journald.conf

echo "disable some autostart"
systemctl disable pacman-init.service choose-mirror.service
rm -r /etc/systemd/system/choose-mirror.service
rm -r /etc/systemd/system/pacman-init.service
rm -r /etc/systemd/system/etc-pacman.d-gnupg.mount
rm -r /etc/systemd/system/getty@tty1.service.d
rm /etc/systemd/scripts/choose-mirror


echo "delete some useless"
rm /etc/systemd/system/getty@tty1.service.d/autologin.conf
rm /root/.automated_script.sh
rm /root/.zlogin
rm /etc/sudoers.d/g_wheel
rm /etc/mkinitcpio-archiso.conf
pacman -R --noconfirm archiso


chmod 700 /root

#delete user arch
userdel -r arch

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
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "make time"
hwclock --systohc --utc


#network
clear
echo "auto start network"
systemctl enable NetworkManager

#start graphical
systemctl set-default graphical.target


install_software
pacman -Rscn --noconfirm dialog

echo Archlinux > /etc/hostname

# root password
read -p "Enter root password: " rootpwd
(echo $rootpwd;sleep 1;echo $rootpwd) | passwd > /dev/null


clear
# new user
read -p "Enter new user: " newuser
echo "${newuser} ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults:${newuser} !authenticate " >> /etc/sudoers
read -p "Enter new user's password: " jonepwd
(echo $jonepwd;sleep 1;echo $jonepwd) | passwd ${newuser} > /dev/null



clear
echo -e "Install over,\nPlease generate grub config yourself \nAnd then\nInput exit and click enter to reboot"
exit 0
}
