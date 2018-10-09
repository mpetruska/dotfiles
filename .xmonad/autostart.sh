#/bin/bash

compton -f &

feh --bg-scale .background &

killall twmnd
twmnd &
