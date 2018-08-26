# python
sudo ln -s /usr/bin/python3 /usr/local/bin/python
sudo ln -s /usr/bin/pip3 /usr/local/bin/pip
sudo pip install pipenv -i https://mirrors.aliyun.com/pypi/simple
sudo pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple
sudo pip install flake8
sudo pip install autoflake
sudo pip install yapf
sudo pip install isort

# neovim
sudo pacman -S --noconfirm go
yaourt ttf-font-icons

sudo ln -s /usr/bin/nvim /usr/local/bin/vi
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman --noconfirm -S conky

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
sudo systemctl enable docker
sudo gpasswd -a `whoami` docker

# editor
yaourt visual-studio-code-bin


yaourt the_platinum_searcher-bin
sudo pip install jsbeautifier

# node
sudo pacman -S --noconfirm nodejs npm
sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
sudo npm install -g vue
sudo pacman -S --noconfirm eslint


# software
yaourt gitkraken
sudo pacman -S --noconfirm mariadb
yaourt wechat-devtools
sudo pacman -S --noconfirm virtualbox
yaourt virtualbox-ext-oracle
sudo pacman -S --noconfirm mongodb
yaourt mongodb-compass
sudo pacman -S --noconfirm ctags
sudo pacman -S --noconfirm php composer
sudo pacman -S --noconfirm xorg-xbacklight
sudo pacman -S --noconfirm nginx
sudo pacman -S --noconfirm otf-fira-code
sudo pacman -S --noconfirm pkgfile
sudo pkgfile --update
yaourt global
yaourt idutils

# i3
sudo pacman -S --noconfirm i3-gaps
sudo pacman -S --noconfirm i3lock
sudo pacman -S --noconfirm i3blocks
sudo pacman -S --noconfirm i3status
sudo pacman -S --noconfirm awesome-terminal-fonts
yaourt bumblebee-status

# openbox
sudo pacman -S --noconfirm openbox
yaourt obkey
yaourt ob-autostart
yaourt networkmanager-dmenu
yaourt polybar
yaourt skippy-xd
yaourt jgmenu
yaourt ttf-material-icons
yaourt otf-font-awesome-5-free
sudo pacman -S --noconfirm obconf


if [ ! -d /home/$(whoami)/.local ]
then
	mkdir -p /home/$(whoami)/.local
fi
cp -a bin /home/$(whoami)/.local/

if [ ! -d /home/$(whoami)/.config ]
then
	mkdir -p /home/$(whoami)/.config
fi
cp -a config/* /home/$(whoami)/.config/

mv /home/$(whoami)/.config/gitconfig /home/$(whoami)/.gitconfig
mv /home/$(whoami)/.config/gitignore_global /home/$(whoami)/.gitignore_global

mv /home/$(whoami)/.config/pip /home/$(whoami)/.pip


sudo pacman -Syu --noconfirm

clear
echo "Need init:\nyaourt\nmariadb\n"
