#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

#Set enviroment variable Monitor and run polybar with monitor
monitor=$(xrandr --query | grep " primary " | cut -d " " -f1)
MONITOR=$monitor polybar --config=~/.config/polybar/polybar.conf top
