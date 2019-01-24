# python
sudo ln -s /usr/bin/python3 /usr/local/bin/python
sudo ln -s /usr/bin/pip3 /usr/local/bin/pip
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

# node
sudo pacman -S --noconfirm nodejs npm
sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
sudo npm install -g vue
sudo npm install -g tern
sudo npm i -g eslint eslint-plugin-vue
sudo pacman -S --noconfirm yarn
yarn config set registry https://registry.npm.taobao.org --global
yarn config set disturl https://npm.taobao.org/dist --global

# software
sudo pacman -S --noconfirm arc-gtk-theme
sudo pacman -S --noconfirm arc-icon-theme
sudo pacman -S --noconfirm fd
sudo pacman -S --noconfirm flameshot
sudo pacman -S --noconfirm gparted
sudo pacman -S --noconfirm gpicview
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm otf-fira-code
sudo pacman -S --noconfirm pkgfile
sudo pacman -S --noconfirm polkit-gnome
sudo pacman -S --noconfirm sakura
sudo pacman -S --noconfirm the_silver_searcher
sudo pacman -S --noconfirm ttf-dejavu
sudo pacman -S --noconfirm ttf-font-awesome
sudo pacman -S --noconfirm ttf-ionicons
sudo pacman -S --noconfirm virtualbox
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
yaourt idutils
yaourt netease-cloud-music
yaourt sublime-text-3-imfix
yaourt vattery
yaourt virtualbox-ext-oracle
yaourt wechat-devtools

# display manager
sudo pacman -S --noconfirm lightdm
sudo pacman -S --noconfirm lightdm-webkit2-greeter
yaourt lightdm-webkit2-theme-material2
sudo systemctl enable lightdm
sudo sed -i 's/#greeter-session=example-gtk-gnome/#greeter-session=example-gtk-gnome\ngreeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
sudo sed -i 's/webkit_theme/#webkit_theme/' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/antergos/antergos\nwebkit_theme = material2/' /etc/lightdm/lightdm-webkit2-greeter.conf
yarn global add prettier
yarn global add html-beautify
yarn global add js-beautify
sudo cnpm install -g css-beautify
yarn global add eslint


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

# gnome
sudo pacman -S --noconfirm gnome
sudo pacman -S --noconfirm gnome-tweaks


if [ ! -d /home/$(whoami)/.config ]
then
	mkdir -p /home/$(whoami)/.config
fi
cp -a config/* /home/$(whoami)/.config/

mv /home/$(whoami)/.config/gitconfig /home/$(whoami)/.gitconfig
mv /home/$(whoami)/.config/gitignore_global /home/$(whoami)/.gitignore_global

mv /home/$(whoami)/.config/pip /home/$(whoami)/.pip

mv /home/$(whoami)/.config/Xresources /home/$(whoami)/.Xresources

mv /home/$(whoami)/.config/zshrc /home/$(whoami)/.zshrc


# custom
sudo cp ./scripts/update-hosts /usr/local/bin/
sudo chmod a+x /usr/local/bin/update-hosts
sudo /usr/local/bin/update-hosts


if [ ! -d /home/$(whoami)/.local/bin ]
then
	mkdir -p /home/$(whoami)/.local/bin
fi
cp ./scripts/wallpaper.sh /home/$(whoami)/.local/bin/

sudo pacman -Syu --noconfirm

# antigen for zsh
curl -L git.io/antigen > ~/.config/antigen.zsh

clear
echo "Need init:\nyaourt\n"
