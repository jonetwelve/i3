
# python
sudo pacman --noconfirm -S python-pip
sudo ln -s /usr/bin/python3 /usr/local/bin/python
sudo ln -s /usr/bin/pip3 /usr/local/bin/pip
sudo pip install pipenv -i https://mirrors.aliyun.com/pypi/simple
sudo pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple

# neovim
sudo pacman --noconfirm -S neovim
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm go
sudo pacman -S --noconfirm chromium
sudo pacman -S --noconfirm wqy-microhei
sudo pacman -S --noconfirm nitrogen
sudo pacman --noconfirm -S compton
yaourt ttf-font-icons 

sudo ln -s /usr/bin/nvim /usr/local/bin/vi
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman --noconfirm -S pcmanfm
sudo pacman --noconfirm -S sakura
sudo pacman --noconfirm -S conky
sudo pacman --noconfirm -S fcitx
sudo pacman --noconfirm -S fcitx-im
sudo pacman --noconfirm -S fcitx-sunpinyin
sudo pacman --noconfirm -S rofi
sudo pacman --noconfirm -S curl
sudo pacman --noconfirm -S fcitx-configtool
sudo pacman --noconfirm -S python-neovim
sudo pacman --noconfirm -S powerline-fonts
sudo pacman --noconfirm -S ntfs-3g

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

# i3wm
sudo pacman -S --noconfirm i3-gaps
sudo pacman -S --noconfirm i3lock
sudo pacman -S --noconfirm i3blocks
sudo pacman -S --noconfirm i3status
sudo pacman -S --noconfirm awesome-terminal-fonts
yaourt bumblebee-status


# software
yaourt gitkraken


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ ! -d /home/$(whoami)/.config ]
then
	mkdir -p /home/$(whoami)/.config
fi
cp -a config/* /home/$(whoami)/.config/

mv /home/$(whoami)/.config/gitconfig /home/$(whoami)/.gitconfig
mv /home/$(whoami)/.config/gitignore_global /home/$(whoami)/.gitignore_global

mv /home/$(whoami)/.config/pip /home/$(whoami)/.pip

sudo pacman -Syu --noconfirm

echo 'export ZSH="/home/jone/.oh-my-zsh"' > /home/`whoami`/.zshrc

echo '' >> /home/`whoami`/.zshrc
echo 'ZSH_THEME="agnoster"' >> /home/`whoami`/.zshrc
echo 'DISABLE_AUTO_UPDATE="true"' >> /home/`whoami`/.zshrc
echo 'DISABLE_LS_COLORS="true"' >> /home/`whoami`/.zshrc
echo 'ENABLE_CORRECTION="true"' >> /home/`whoami`/.zshrc
echo '' >> /home/`whoami`/.zshrc

echo '' >> /home/`whoami`/.zshrc
echo 'plugins=(' >> /home/`whoami`/.zshrc
echo 'archlinux,autoenv,autopep8,composer,cp,docker,docker-compose,docker-machine,' >> /home/`whoami`/.zshrc
echo 'dotenv,fabric,git,git-extras,git-flow,gitignore,go,golang,history,laravel5,' >> /home/`whoami`/.zshrc
echo 'meteor,npm,pip,pylint,python,sudo,supervisor,systemd,virtualenv,vscode,yarn' >> /home/`whoami`/.zshrc
echo ')' >> /home/`whoami`/.zshrc
echo '' >> /home/`whoami`/.zshrc

echo '' >> /home/`whoami`/.zshrc
echo 'source $ZSH/oh-my-zsh.sh' >> /home/`whoami`/.zshrc
