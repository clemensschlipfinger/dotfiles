#!/bin/dash
#
#  ~/.xinitrc X Server Startup
#

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then 
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

### Set Env ###
export XDG_CURRENT_DESKTOP=GNOME

#QT
export QT_FONT_DPI=80
export QT_STYLE_OVERRIDE=adwaita-dark
#export QT_STYLE_OVERRIDE=qt5ct

#Java 
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export _JAVA_AWT_WM_NONREPARENTING=1 #window fix java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on' # font fix java

### Start Up ###

#Set mouse cursor
xsetroot -cursor_name left_ptr

#Swap <Esc> key with <Caps> key
setxkbmap -option caps:swapescape

#Set keybindings for X:
#xbindkeys -p &

### Start Desktop Apps ###
#set default theme
DESKTOP_DEFAULT_THEME=$(cat ~/.config/desktop-themes/default)

# set wallpaper
feh --no-fehbg --bg-scale $(cat ~/.config/desktop-themes/$DESKTOP_DEFAULT_THEME/feh)

# setup links for default theme
~/.local/bin/themeswitcher $DESKTOP_DEFAULT_THEME -no-x

# polkit agent
lxqt-policykit-agent &

#screen locker
#xss-lock /bin/slock &
xss-lock -- dash -c "XSECURELOCK_NO_COMPOSITE=1 xsecurelock" &

#compositor
picom &

#Start Xmonad 
exec ~/.xmonad/xmonad-x86_64-linux
