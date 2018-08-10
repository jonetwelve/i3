
# python
sudo pacman --noconfirm -S python-pip
sudo ln -s /usr/bin/python3 /usr/local/bin/python
sudo ln -s /usr/bin/pip3 /usr/local/bin/pip
sudo pip install pipenv -i https://mirrors.aliyun.com/pypi/simple
sudo pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple

# sudo
echo "`whoami` ALL=(ALL) ALL" | sudo tee -a /etc/sudoers
echo "Defaults:`whoami`    !authenticate" | sudo tee -a /etc/sudoers

# neovim
sudo pacman --noconfirm -S neovim git zsh powerpill go chromium wqy-microhei
sudo pacman --noconfirm -S ttf-font-icons compton nitrogen

sudo ln -s /usr/bin/nvim /usr/local/bin/vi
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman --noconfirm -S pcmanfm sakura conky fcitx fcitx-im fcitx-sunpinyin rofi curl
sudo pacman --noconfirm -S fcitx-configtool python-neovim powerline-fonts yaourt ntfs-3g

# docker
sudo pacman -S --noconfirm docker docker-compose
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

yaourt yandex-browser-beta

yaourt the_platinum_searcher-bin
sudo pip install jsbeautifier

# node
sudo pacman -S --noconfirm nodejs npm
sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
sudo npm install -g vue

# i3wm
sudo pacman -S --noconfirm i3-gaps i3lock i3blocks i3status
yaourt bumblebee-status




# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [	! -d /home/$(whoami)/.config ]
then
	mkdir -p /home/$(whoami)/.config
fi
cp -a config/* /home/$(whoami)/.config/

mv /home/$(whoami)/.config/gitconfig /home/$(whoami)/.gitconfig
mv /home/$(whoami)/.config/gitignore_global /home/$(whoami)/.gitignore_global

mv /home/$(whoami)/.config/pip /home/$(whoami)/.pip

sudo pacman -Syu --noconfirm
