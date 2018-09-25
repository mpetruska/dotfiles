# Java home

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Git branch in prompt

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_directory() {
    basename `git rev-parse --show-toplevel 2> /dev/null` 2> /dev/null
}

export PS1="\W \[\033[33m\]\$(parse_git_directory)\[\033[00m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Node and npm

export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

# Local node bin

export PATH="./node_modules/.bin:$PATH"

# Local bin

export PATH="${HOME}/.local/bin:$PATH"

# Ssh agent

eval "$(ssh-agent -s)" > /dev/null

# Local extensions

if [ -f .bashrc_local ]; then
  source .bashrc_local
fi
