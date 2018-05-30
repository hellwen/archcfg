all: push

add:
	git add .

commit: add
	git commit -am "ok"

push: commit
	git push origin master

build:
	ln -s ~/.archcfg/xinitrc ~/.xinitrc
	ln -s ~/.archcfg/Xresources ~/.Xresources
	ln -s ~/.archcfg/bashrc ~/.bashrc
	ln -s ~/.archcfg/bash_profile ~/.bash_profile
	ln -s ~/.archcfg/xorg.conf.d/ /etc/X11/xorg.conf.d
	ln -s ~/.archcfg/i3 ~/.i3
	ln -s ~/.archcfg/nvim ~/.config/nvim
	ln -s ~/.archcfg/ranger ~/.config/ranger
