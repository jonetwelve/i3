

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
ln -sb `pwd`/dotfiles/config/termite /home/`whoami`/.config/termite
ln -sb `pwd`/dotfiles/config/nvim /home/`whoami`/.config/nvim
ln -sb `pwd`/dotfiles/config/compton.conf /home/`whoami`/.config/compton.conf
ln -sb `pwd`/dotfiles/config/conky /home/`whoami`/.config/conky
ln -sb `pwd`/dotfiles/pam_environment /home/`whoami`/.pam_environment
touch /home/$(whoami)/.custom_source

storage=$(dirname $(dirname $(dirname $(pwd))))
ln -sb $storage/Documents /home/`whoami`/Documents
ln -sb $storage/Downloads /home/`whoami`/Downloads
ln -sb $storage/Pictures /home/`whoami`/Pictures
ln -sb $storage/Workspace /home/`whoami`/Workspace
ln -sb $storage/Workspace/go /home/`whoami`/go

if [ ! -d /home/$(whoami)/.local/bin]
then
	mkdir -p /home/$(whoami)/.local/bin
fi
cp -a ./scripts/* /home/$(whoami)/.local/bin/
