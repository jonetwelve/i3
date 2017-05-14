#!/usr/bin/env sh

#安装软件
sudo pacman -Syy --noconfirm
sudo pacman -S --noconfirm git volumeicon scrot lxappearance compton feh conky\
	xautolock xbacklight fcitx fcitx-im fcitx-sunpin sakura rofi volumeicon\
	fcitx-configtool firefox python-pip neovim python-neovim powerline-fonts

sudo ln -s /usr/bin/nvim /usr/local/bin/vi

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ ! -d ~/.local/bin ]
then
	mkdir -p ~/.local/bin
fi
cp -a bin/* ~/.local/bin/
chmod 777 ~/.local/bin/*



if [	! -d ~/.config ]
then
	mkdir -p ~/.config
fi
cp -a config/* ~/.config/

mv ~/.config/gitconfig ~/.gitconfig

# nvim配置
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mv Templates ~/

mv ~/.config/pip ~/.pip
sudo pip install py3status


