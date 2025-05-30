#      _          _ _                    __ _                       _   _
#  ___| |__   ___| | |   ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __
# / __| '_ \ / _ \ | |  / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
# \__ \ | | |  __/ | | | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |
# |___/_| |_|\___|_|_|  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
#                                             |___/

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

#ZSH_THEME="random"
#ZSH_THEME="agnoster"
#ZSH_THEME="headline"
#ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "arrow" "awesomepanda" "clean" "cloud" "fwalch" \
#			      "gozilla" "gallois" "kolo" "mh" "minimal" "nanotech" \
#			      "norm" "robbyrussell" "sorin" "sunrise" "terminalparty" \
#			      "theunraveler" "wedisagree" "wezm" )

SPACESHIP_EXIT_CODE_SHOW=true

# load zgen
if [ -f "${HOME}/.zgen/zgen.zsh" ]; then
  source "${HOME}/.zgen/zgen.zsh"
elif [ -f "/usr/share/zsh/share/zgen.zsh" ]; then
  source "/usr/share/zsh/share/zgen.zsh"
fi

# if the init script doesn't exist
if ! zgen saved; then

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/gitfast
  zgen oh-my-zsh plugins/wd
  zgen load zsh-users/zsh-autosuggestions
  zgen load mafredri/zsh-async
  # zgen load seletskiy/zsh-fuzzy-search-and-edit
  zgen load wfxr/forgit

  # themes
  # zgen oh-my-zsh themes/agnoster
  # zgen oh-my-zsh themes/arrow
  # zgen oh-my-zsh themes/awesomepanda
  # zgen oh-my-zsh themes/clean
  # zgen oh-my-zsh themes/cloud
  # zgen oh-my-zsh themes/darkblood
  # zgen oh-my-zsh themes/fwalch
  # zgen oh-my-zsh themes/gozilla
  # zgen oh-my-zsh themes/gallois
  # zgen oh-my-zsh themes/jonathan
  # zgen load Moarram/headline headline main
  # zgen load spaceship-prompt/spaceship-prompt spaceship
  # zgen load nikhilkmr300/omz-themes themes/matte-black-yellow-line
  # zgen oh-my-zsh themes/kolo
  # zgen load ergenekonyigit/lambda-gitster
  # zgen oh-my-zsh themes/mh
  # zgen oh-my-zsh themes/minimal
  # zgen oh-my-zsh themes/nanotech
  # zgen oh-my-zsh themes/norm
  # zgen oh-my-zsh themes/robbyrussell
  # zgen oh-my-zsh themes/sorin
  # zgen oh-my-zsh themes/sunrise
  # zgen oh-my-zsh themes/terminalparty
  # zgen oh-my-zsh themes/theunraveler
  # zgen oh-my-zsh themes/wedisagree
  # zgen oh-my-zsh themes/wezm

  # generate the init script from plugins above
  zgen save
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9c9c9c"

# key bindings
# bindkey '^P' fuzzy-search-and-edit

# Starship prompt
eval "$(starship init zsh)"

#  _              _                        __ _                       _   _
# | |_ ___   ___ | |___    ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __
# | __/ _ \ / _ \| / __|  / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
# | || (_) | (_) | \__ \ | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |
#  \__\___/ \___/|_|___/  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
#                                               |___/

# Default editor is Emacs as it should be...

export EDITOR="emacs -nw"
alias edit="emacs -nw"

# wttr.in

wttr()
{
  local request="wttr.in/$1?2Fq"
  [ "$COLUMNS" -lt 125 ] && request+='n'
  curl --compressed "$request"
}

# Local extensions

if [ -f "$HOME/.zshrc_local" ]; then
  source "$HOME/.zshrc_local"
fi

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
