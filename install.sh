#!/usr/bin/env sh

if[	! -d ~/.local/bin ]
then
	mkdir -p ~/.local/bin
fi
cp bin/* ~/.local/bin/
chmod 777 ~/.local/bin/*



if[	! -d ~/.config ]
then
	mkdir -p ~/.config
fi
cp config/* ~/.config
mv ~/.config/gitconfig ~/.gitconfig

pacman -S --noconfirm volumeicon scrot lxappearance compton feh conky\
	xautolock xbacklight fcitx fcitx-im fcitx-sunpin
