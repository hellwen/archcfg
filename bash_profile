#
# ~/.bash_profile
#

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

# pyenv 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# disable touchpad
# xinput list all drives
#xinput disable 11

# set ibm trackpoint speed
# xinput --set-prop 12 'libinput Accel Speed' 0.1
