

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
ln -s `pwd`/dotfiles/config/conky /home/`whoami`/.config/conky
ln -s `pwd`/dotfiles/pam_environment /home/`whoami`/.pam_environment
touch /home/$(whoami)/.custom_source

storage=$(dirname $(dirname $(dirname $(pwd))))
ln -s $storage/Documents /home/`whoami`/Documents
ln -s $storage/Downloads /home/`whoami`/Downloads
ln -s $storage/Pictures /home/`whoami`/Pictures
ln -s $storage/Workspace /home/`whoami`/Workspace
ln -s $storage/Workspace/go /home/`whoami`/go