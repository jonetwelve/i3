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
sudo pacman -S --noconfirm go yaourt powerpill
yaourt ttf-font-icons

sudo ln -s /usr/bin/nvim /usr/local/bin/vi

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
sudo pacman -S --noconfirm the_silver_searcher
sudo pacman -S --noconfirm wine
sudo pacman -S --noconfirm flameshot
sudo pacman -S --noconfirm gparted
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
yaourt php-cs-fixer
sudo pacman -S --noconfirm medit
sudo pacman -S --noconfirm gpicview
sudo pacman -S --noconfirm ttf-dejavu
sudo pacman -S --noconfirm sakura
sudo pacman -S --noconfirm ttf-font-awesome
sudo pacman -S --noconfirm ttf-ionicons
sudo pacman -S --noconfirm arc-icon-theme
sudo pacman -S --noconfirm arc-gtk-theme
sudo pacman -S --noconfirm vlc
yaourt electronic-wechat
yaourt command-not-found
yaourt franz
# display manager
sudo pacman -S --noconfirm lightdm
sudo pacman -S --noconfirm lightdm-webkit2-greeter
yaourt lightdm-webkit2-theme-material2
sudo systemctl enable lightdm
sudo sed -i 's/#greeter-session=example-gtk-gnome/#greeter-session=example-gtk-gnome\ngreeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
sudo sed -i 's/webkit_theme/#webkit_theme/' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/antergos/antergos\nwebkit_theme = material2/' /etc/lightdm/lightdm-webkit2-greeter.conf


# i3
sudo pacman -S --noconfirm i3-gaps
sudo pacman -S --noconfirm i3lock
sudo pacman -S --noconfirm awesome-terminal-fonts
# i3pystatus
yaourt i3pystatus
sudo pacman -S --noconfirm python-netifaces
sudo pacman -S --noconfirm python-colour
sudo pacman -S --noconfirm python-psutil
yaourt python-basiciw
sudo pip install pyalsaaudio
sudo pip install i3ipc


mv config/zshrc /home/$(whoami)/.zshrc
if [ ! -d /home/$(whoami)/.config ]
then
	mkdir -p /home/$(whoami)/.config
fi
cp -a config/* /home/$(whoami)/.config/

mv /home/$(whoami)/.config/gitconfig /home/$(whoami)/.gitconfig
mv /home/$(whoami)/.config/gitignore_global /home/$(whoami)/.gitignore_global

mv /home/$(whoami)/.config/pip /home/$(whoami)/.pip

mv /home/$(whoami)/.config/Xresources /home/$(whoami)/.Xresources


# custom
sudo cp ./scripts/update-hosts /usr/local/bin/
sudo chmod a+x /usr/local/bin/update-hosts
sudo /usr/local/bin/update-hosts

sudo pacman -Syu --noconfirm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

clear
echo "Need init:\nyaourt\nmariadb\n"
