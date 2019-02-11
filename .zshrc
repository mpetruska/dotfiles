#      _          _ _                    __ _                       _   _
#  ___| |__   ___| | |   ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __
# / __| '_ \ / _ \ | |  / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
# \__ \ | | |  __/ | | | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |
# |___/_| |_|\___|_|_|  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
#                                             |___/

ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "arrow" "awesomepanda" "clean" "cloud" "fwalch" \
			      "gozilla" "gallois" "kolo" "mh" "minimal" "nanotech" \
			      "norm" "robbyrussell" "sorin" "sunrise" "terminalparty" \
			      "theunraveler" "wedisagree" "wezm" )

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/wd
  zgen load zsh-users/zsh-autosuggestions
  zgen load mafredri/zsh-async
  zgen load seletskiy/zsh-fuzzy-search-and-edit

  # themes
  zgen oh-my-zsh themes/arrow
  zgen oh-my-zsh themes/awesomepanda
  zgen oh-my-zsh themes/clean
  zgen oh-my-zsh themes/cloud
  zgen oh-my-zsh themes/fwalch
  zgen oh-my-zsh themes/gozilla
  zgen oh-my-zsh themes/gallois
  zgen oh-my-zsh themes/kolo
  # zgen load ergenekonyigit/lambda-gitster
  zgen oh-my-zsh themes/mh
  zgen oh-my-zsh themes/minimal
  zgen oh-my-zsh themes/nanotech
  zgen oh-my-zsh themes/norm
  zgen oh-my-zsh themes/robbyrussell
  zgen oh-my-zsh themes/sorin
  zgen oh-my-zsh themes/sunrise
  zgen oh-my-zsh themes/terminalparty
  zgen oh-my-zsh themes/theunraveler
  zgen oh-my-zsh themes/wedisagree
  zgen oh-my-zsh themes/wezm

  zgen oh-my-zsh

  # bindings
  bindkey '^P' fuzzy-search-and-edit

  # generate the init script from plugins above
  zgen save
fi

#  _              _                        __ _                       _   _
# | |_ ___   ___ | |___    ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __
# | __/ _ \ / _ \| / __|  / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
# | || (_) | (_) | \__ \ | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |
#  \__\___/ \___/|_|___/  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
#                                               |___/

# Default editor

export EDITOR=vim

# sbt options

export SBT_OPTS="-Xms1024M -Xmx2048M -Xss4M -XX:MaxMetaspaceSize=2048M"

# npm

export PATH="node_modules/.bin:$PATH"

