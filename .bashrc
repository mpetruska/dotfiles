
# Default editor

export EDITOR=vim

# Git branch in prompt

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_directory() {
    basename `git rev-parse --show-toplevel 2> /dev/null` 2> /dev/null
}

export PS1="\W \[\033[32m\]\$(parse_git_directory)\[\033[00m\]\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "

# sbt options

export SBT_OPTS="-Xms1024M -Xmx2048M -Xss4M -XX:MaxMetaspaceSize=2048M"

# npm

export PATH="node_modules/.bin:$PATH"

# Local extensions

if [ -f .bashrc_local ]; then
  source .bashrc_local
fi
