# tools
pacman -S feh
pacman -S rofi

# z.sh
chmod +x ~/.archcfg/z.sh

ln -s ~/.archcfg/xinitrc ~/.xinitrc
ln -s ~/.archcfg/bashrc ~/.bashrc
ln -s ~/.archcfg/bash_profile ~/.bash_profile
# ln -s ~/.archcfg/xorg.conf.d/ /etc/X11/xorg.conf.d


# i3

pacman -S scrot xclip
pacman -S i3 i3blocks i3lock

## config
ln -s ~/.archcfg/i3 ~/.config/i3

# nvm

pacman -S neovim

## vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## config
ln -s ~/.archcfg/nvim ~/.config/nvim


# ranger

pacman -S ranger

## config
ln -s ~/.archcfg/ranger ~/.config/ranger

