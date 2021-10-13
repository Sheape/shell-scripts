#!/usr/bin/env bash

#TITLE: autostart.sh
#This script is going to start all the processes and commands written in this file.

wallpaper_path="$HOME/.config/qtile/assets/wallpaper/cityscape-pixel-art-sunlight.png"

picom -b --experimental-backends &
wired &
redshift &
feh --bg-fill $wallpaper_path &
setxkbmap -layout us -variant workman && xset r 66 &
emacs --daemon
