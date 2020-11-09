#/bin/bash

xgamma -gamma 0.85

compton -f &

feh --bg-scale .background &

killall xfce4-notifyd
xfce4-notifyd &

emacs --bg-daemon
