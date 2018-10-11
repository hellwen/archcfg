#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# disable touchpad
# xinput list all drives
# xinput disable 11

# set ibm trackpoint speed
#xinput --set-prop 12 'libinput Accel Speed' 0.1

# pipenv
eval "$(pipenv --completion)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
