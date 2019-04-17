#!/usr/bin/env bash

ABSPATH=$(cd "$(dirname "$0")"; pwd)

ln -s $ABSPATH/.ackrc ~/.ackrc
ln -s $ABSPATH/.agignore ~/.agignore
ln -s $ABSPATH/.ctags ~/.ctags
ln -s $ABSPATH/.gemrc ~/.gemrc
ln -s $ABSPATH/.gitconfig ~/.gitconfig
ln -s $ABSPATH/.hushlogin ~/.hushlogin
ln -s $ABSPATH/.oh-my-zsh ~/.oh-my-zsh
ln -s $ABSPATH/.nvim/ ~/.config/nvim
ln -s $ABSPATH/.zshrc ~/.zshrc
