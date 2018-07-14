#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# pyenv 
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# disable touchpad
# xinput list all drives
# xinput disable 11

# set ibm trackpoint speed
#xinput --set-prop 12 'libinput Accel Speed' 0.1

# pipenv
eval "$(pipenv --completion)"
