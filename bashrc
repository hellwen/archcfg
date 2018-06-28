#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

function _update_ps1() {
    PS1="$(~/Develop/go/bin/powerline-go -colorize-hostname -mode flat -cwd-mode plain)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias scrotclip="file=~/images/`date "+%Y%m%d-%H%M%S_scrot.png"` && scrot ${file}"
alias more='less'
alias vib='vi'
alias vi='nvim'

# for git
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue[%cn]%Cgreen(%cr)%Creset' --abbrev-commit"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"

alias prp="pipenv run python"

set -o vi

export VISUAL="vim"


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
# setxkbmap -layout us -option ctrl:nocaps
# xmodmap -e 'clear Lock'
# xmodmap -e 'keycode 0x7e = Control_R'
# xmodmap -e 'add Control = Control_R'

# 每次记录cd的目录，并在打开term的时候默认打开
function cd {
    builtin cd $@
    echo $(pwd) > /tmp/whereami
}
if [ -f /tmp/whereami ]; then
    cd "`cat /tmp/whereami`"
fi


