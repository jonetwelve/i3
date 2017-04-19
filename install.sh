#!/usr/bin/env sh

#安装软件
pacman -Syy --noconfirm
pacman -S --noconfirm git volumeicon scrot lxappearance compton feh conky\
	xautolock xbacklight fcitx fcitx-im fcitx-sunpin sakura rofi volumeicon\
	fcitx-configtool firefox python-pip


if [ ! -d ~/.local/bin ]
then
	mkdir -p ~/.local/bin
fi
cp bin/* ~/.local/bin/
chmod 777 ~/.local/bin/*



if [	! -d ~/.config ]
then
	mkdir -p ~/.config
fi
cp config/* ~/.config

mv ~/.config/gitconfig ~/.gitconfig

# vim配置
mv ~/.config/vimrc ~/.vimrc
mkdir ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mv Templates ~/

mv ~/.config/pip ~/.pip
pip install py3status


