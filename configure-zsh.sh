#!/usr/env bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl https://raw.githubusercontent.com/ergenekonyigit/lambda-gitster/master/lambda-gitster.zsh-theme > ~/.oh-my-zsh/themes/lambda-gitster.zsh-theme

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
