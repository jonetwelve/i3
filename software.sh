# python
pip install --user pipenv -i https://mirrors.aliyun.com/pypi/simple
pip install --user --upgrade pip -i https://mirrors.aliyun.com/pypi/simple
pip install --user flake8
pip install --user yapf
pip install --user black
pip install --user isort


sudo pacman -S --noconfirm go
yay ttf-font-icons

# docker
#sudo pacman -S --noconfirm docker
#sudo pacman -S --nocnofirm docker-compose
#if [ ! -d /etc/docker ]
#then
#	sudo mkdir -p /etc/docker
#fi
#sudo touch /etc/docker/daemon.json
#sudo chmod a+w /etc/docker/daemon.json
#echo '{"registry-mirrors": ["https://registry.docker-cn.com"]}' > /etc/docker/daemon.json
#sudo gpasswd -a `whoami` docker

# editor
yay visual-studio-code-bin

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
sudo pacman -S --noconfirm fabrci
sudo pacman -S --noconfirm fd
sudo pacman -S --noconfirm flameshot
sudo pacman -S --noconfirm gimp 
sudo pacman -S --noconfirm global
sudo pacman -S --noconfirm gparted
sudo pacman -S --noconfirm gpicview
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm netease-cloud-music
sudo pacman -S --noconfirm otf-fira-code
sudo pacman -S --noconfirm pkgfile
sudo pacman -S --noconfirm polkit-gnome
sudo pacman -S --noconfirm smplayer
sudo pacman -S --noconfirm sublime-text-imfix
sudo pacman -S --noconfirm termite 
sudo pacman -S --noconfirm ripgrep
sudo pacman -S --noconfirm ttf-dejavu
sudo pacman -S --noconfirm ttf-font-awesome
sudo pacman -S --noconfirm ttf-ionicons
sudo pacman -S --noconfirm xautolock
sudo pacman -S --noconfirm xorg-xbacklight
sudo pacman -S --noconfirm xorg-xmessage
sudo pkgfile --update
yay command-not-found
yay gitblade-bin
yay motrix-git
yay valentina-studio

yarn global add prettier
yarn global add html-beautify
yarn global add js-beautify
sudo npm install -g css-beautify
yarn global add eslint


# i3
sudo pacman -S --noconfirm i3-gaps
sudo pacman -S --noconfirm i3lock
sudo pacman -S --noconfirm awesome-terminal-fonts
# i3pystatus
pip3 install --user git+https://github.com/enkore/i3pystatus.git
sudo pacman -S --noconfirm python-psutil
sudo pacman -S --noconfirm python-colour
sudo pacman -S --noconfirm python-netifaces
yay i3ipc-python
yay python-basiciw
pip install --user pyalsaaudio

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

clear
