#
# ~/.profile
#
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

[[ -z $DISPLAY ]] && [[ $(tty) = "/dev/tty1" ]] && exec startx
