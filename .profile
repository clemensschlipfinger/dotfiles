#
# ~/.profile
#
export EDITOR=nvim
export PATH="/home/clemens/.local/bin:$PATH"

[[ -z $DISPLAY ]] && [[ $(tty) = "/dev/tty1" ]] && exec startx
