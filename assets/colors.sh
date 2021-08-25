#!/usr/bin/env bash

### Colors

reset="\033[0m"

setForeground(){
    fg="\033[${1};3${2}m";
}

setBackground(){
    bg="\033[4${1}m";
}
