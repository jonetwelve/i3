
sudo pacman -Syy
# python
pip install --user pipenv -i https://mirrors.aliyun.com/pypi/simple
pip install --user --upgrade pip -i https://mirrors.aliyun.com/pypi/simple
pip install --user flake8
pip install --user yapf
pip install --user black
pip install --user isort


sudo pacman -S --noconfirm go
trizen ttf-font-icons

# node
sudo pacman -S --noconfirm nodejs npm
sudo npm install -g tern
sudo npm i -g eslint eslint-plugin-vue
sudo pacman -S --noconfirm yarn
yarn config set registry https://registry.npm.taobao.org --global
yarn config set disturl https://npm.taobao.org/dist --global

# software
sudo pacman -S --noconfirm archlabs-dArk
sudo pacman -S --noconfirm exo
sudo pacman -S --noconfirm fabrci
sudo pacman -S --noconfirm fd
sudo pacman -S --noconfirm feh
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm flameshot
sudo pacman -S --noconfirm global
sudo pacman -S --noconfirm gparted
sudo pacman -S --noconfirm gpicview
sudo pacman -S --noconfirm ttf-jetbrains-mono
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm otf-fira-code
sudo pacman -S --noconfirm pkgfile
sudo pacman -S --noconfirm polkit-gnome
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm termite
sudo pacman -S --noconfirm ripgrep
sudo pacman -S --noconfirm ttf-dejavu
sudo pacman -S --noconfirm ttf-font-awesome
sudo pacman -S --noconfirm ttf-ionicons
sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm visual-studio-code-bin
sudo pacman -S --noconfirm xautolock
sudo pacman -S --noconfirm xorg-xbacklight
sudo pacman -S --noconfirm xorg-xmessage
sudo pkgfile --update
trizen oh-my-zsh-git

yarn global add prettier
yarn global add html-beautify
yarn global add js-beautify
sudo npm install -g css-beautify
yarn global add eslint

# theme
trizen ant-theme-git
trizen whitesur-icon-theme
trizen bibata-cursor-theme


# i3
sudo pacman -S --noconfirm i3-gaps
sudo pacman -S --noconfirm i3lock
sudo pacman -S --noconfirm i3status
sudo pacman -S --noconfirm awesome-terminal-fonts
trizen yagostatus

# openbox
sudo pacman -S --noconfirm openbox
sudo pacman -S --noconfirm obkey-git
trizen clearine


clear
