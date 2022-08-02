#
# ~/.profile
#

# Environment Vars
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

## dotnet cli
export DOTNET_CLI_TELEMETRY_OPTOUT=1
## android
export ANDROID_HOME="$XDG_DATA_HOME"/android
##cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
##cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
##go
export GOPATH="$XDG_DATA_HOME"/go
##grandle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
##gtk-2
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
##rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
##stack
export STACK_ROOT="$XDG_DATA_HOME"/stack

[[ -z $DISPLAY ]] && [[ $(tty) = "/dev/tty1" ]] && exec startx
