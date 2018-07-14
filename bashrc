#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

function _update_ps1() {
    PS1="$(~/Develop/go/bin/powerline-go -colorize-hostname -mode flat -cwd-mode plain)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# # autoj
# if [ "$TERM" != "linux" ]; then
#     PROMPT_COMMAND="(autoj -p \"\$(command pwd -P 2>/dev/null)\" 2>/dev/null &); $PROMPT_COMMAND"
# fi
# alias j='autoj'
 
# 快速 cd
. ~/.archcfg/z.sh

alias vib='vi'
alias vi='nvim'
alias ls='ls --color=auto'

# for git
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue[%cn]%Cgreen(%cr)%Creset' --abbrev-commit"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gd="git diff"

set -o vi

export VISUAL="vi"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# golang
export GOROOT=$HOME/Develop/go1.9.7
export GOPATH=$HOME/Develop/go
export GOBIN=$HOME/Develop/go/bin

export PATH=$PATH:$GOROOT/bin:$GOBIN

# key map
# setxkbmap -layout us -option ctrl:nocaps
# xmodmap -e 'clear Lock'
# xmodmap -e 'keycode 0x7e = Control_R'
# xmodmap -e 'add Control = Control_R'

