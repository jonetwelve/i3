

if [ ! -d /home/$(whoami)/.config ]
then
	mkdir -p /home/$(whoami)/.config
fi
ln -sb `pwd`/dotfiles/gitconfig /home/`whoami`/.gitconfig
ln -sb `pwd`/dotfiles/gitignore_global /home/`whoami`/.gitignore_global
ln -sb `pwd`/dotfiles/xprofile /home/`whoami`/.xprofile
ln -sb `pwd`/dotfiles/Xresources /home/`whoami`/.Xresources
ln -sb `pwd`/dotfiles/yarnrc /home/`whoami`/.yarnrc
ln -sb `pwd`/dotfiles/zshrc /home/`whoami`/.zshrc
ln -sb `pwd`/dotfiles/config/i3 /home/`whoami`/.config/i3
ln -sb `pwd`/dotfiles/config/openbox /home/`whoami`/.config/openbox
ln -sb `pwd`/dotfiles/config/termite /home/`whoami`/.config/termite
ln -sb `pwd`/dotfiles/config/picom.conf /home/`whoami`/.config/picom.conf
ln -sb `pwd`/dotfiles/pam_environment /home/`whoami`/.pam_environment
ln -sb `pwd`/dotfiles/pip /home/`whoami`/.pip
touch /home/$(whoami)/.custom_source

storage=$(dirname $(dirname $(pwd)))
ln -sb $storage/Documents /home/`whoami`/Documents
ln -sb $storage/Downloads /home/`whoami`/Downloads
ln -sb $storage/Pictures /home/`whoami`/Pictures
ln -sb $storage/Music /home/`whoami`/Music
ln -sb $storage/Videos /home/`whoami`/Videos
ln -sb $storage/Workspace /home/`whoami`/Workspace
ln -sb $storage/go /home/`whoami`/go

if [ ! -d /home/$(whoami)/Desktop ]
then
	mkdir -p /home/$(whoami)/Desktop
fi

if [ ! -d /home/$(whoami)/.local/bin ]
then
	mkdir -p /home/$(whoami)/.local/bin
fi
cp -a ./scripts/* /home/$(whoami)/.local/bin/
