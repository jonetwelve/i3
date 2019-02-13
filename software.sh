# python
sudo pip install pipenv -i https://mirrors.aliyun.com/pypi/simple
sudo pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple
sudo pip install flake8
sudo pip install yapf
sudo pip install black
sudo pip install isort


# neovim
sudo pacman -S --noconfirm go
sudo pacman -S --noconfirm yaourt powerpill
yaourt ttf-font-icons

# docker
sudo pacman -S --noconfirm docker
sudo pacman -S --nocnofirm docker-compose
if [ ! -d /etc/docker ]
then
	sudo mkdir -p /etc/docker
fi
sudo touch /etc/docker/daemon.json
sudo chmod a+w /etc/docker/daemon.json
echo '{"registry-mirrors": ["https://registry.docker-cn.com"]}' > /etc/docker/daemon.json
sudo gpasswd -a `whoami` docker

# editor
yaourt visual-studio-code-bin

# node
sudo pacman -S --noconfirm nodejs npm
sudo npm install -g tern
sudo npm i -g eslint eslint-plugin-vue
sudo pacman -S --noconfirm yarn
yarn config set registry https://registry.npm.taobao.org --global
yarn config set disturl https://npm.taobao.org/dist --global

# software
sudo pacman -S --noconfirm arc-gtk-theme
sudo pacman -S --noconfirm elementary-icon-theme
sudo pacman -S --noconfirm fd
sudo pacman -S --noconfirm flameshot
sudo pacman -S --noconfirm gparted
sudo pacman -S --noconfirm gpicview
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm otf-fira-code
sudo pacman -S --noconfirm pkgfile
sudo pacman -S --noconfirm polkit-gnome
sudo pacman -S --noconfirm termite 
sudo pacman -S --noconfirm the_silver_searcher
sudo pacman -S --noconfirm ttf-dejavu
sudo pacman -S --noconfirm ttf-font-awesome
sudo pacman -S --noconfirm ttf-ionicons
sudo pacman -S --noconfirm virtualbox
sudo pacman -S --noconfirm virtualbox-host-modules-arch
sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm wine
sudo pacman -S --noconfirm xautolock
sudo pacman -S --noconfirm xorg-xbacklight
sudo pacman -S --noconfirm xorg-xmessage
sudo pkgfile --update
yaourt command-not-found
yaourt franz4-bin
yaourt gitkraken
yaourt global
yaourt i3-battery-popup-git
yaourt idutils
yaourt netease-cloud-music
yaourt rcm
yaourt sublime-text-3-imfix
yaourt vattery
yaourt virtualbox-ext-oracle
yaourt wechat-devtools

yarn global add prettier
yarn global add html-beautify
yarn global add js-beautify
sudo npm install -g css-beautify
yarn global add eslint


# i3
sudo pacman -S --noconfirm i3-gaps
sudo pacman -S --noconfirm i3lock
sudo pacman -S --noconfirm awesome-terminal-fonts

# gnome
sudo pacman -S --noconfirm gnome
sudo pacman -S --noconfirm gnome-tweaks


if [ ! -d /home/$(whoami)/.config ]
then
	mkdir -p /home/$(whoami)/.config
fi
ln -s `pwd`/dotfiles/gitconfig /home/`whoami`/.gitconfig
ln -s `pwd`/dotfiles/gitignore_global /home/`whoami`/.gitignore_global
ln -s `pwd`/dotfiles/xprofile /home/`whoami`/.xprofile
ln -s `pwd`/dotfiles/Xresources /home/`whoami`/.Xresources
ln -s `pwd`/dotfiles/yarnrc /home/`whoami`/.yarnrc
ln -s `pwd`/dotfiles/zshrc /home/`whoami`/.zshrc
ln -s `pwd`/dotfiles/config/i3 /home/`whoami`/.config/i3
ln -s `pwd`/dotfiles/config/termite /home/`whoami`/.config/termite
ln -s `pwd`/dotfiles/config/compton.conf /home/`whoami`/.config/compoton.conf


# custom
sudo cp ./scripts/jstart /usr/local/bin/
sudo chmod a+x /usr/local/bin/jstart

sudo cp ./scripts/update-hosts /usr/local/bin/
sudo chmod a+x /usr/local/bin/update-hosts
sudo /usr/local/bin/update-hosts


sudo pacman -Syu --noconfirm

# oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

clear
echo "Need init:\nyaourt\n"
