#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias scrotclip="file=~/images/`date "+%Y%m%d-%H%M%S_scrot.png"` && scrot ${file}"
alias chrome='google-chrome-stable'
alias more='less'
alias vib='vi'
alias vi='nvim'
set -o vi


# pyenv 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# golang
export GOROOT=$HOME/Develop/go1.9.4
export GOPATH=$HOME/Develop/go

export PATH=$PATH:$GOROOT/bin:$HOME/Develop/go/bin

# key map
setxkbmap -layout us -option ctrl:nocaps
# xmodmap -e 'clear Lock'
# xmodmap -e 'keycode 0x7e = Control_R'
# xmodmap -e 'add Control = Control_R'
