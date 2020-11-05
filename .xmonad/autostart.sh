#/bin/bash

xgamma -gamma 0.85

compton -f &

feh --bg-scale .background &

killall lxqt-notificationd
lxqt-notificationd &

emacs --bg-daemon
