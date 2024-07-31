#!/usr/bin/env bash

ABSPATH=$(cd "$(dirname "$0")"; pwd)

ln -s $ABSPATH/.ctags ~/.ctags
ln -s $ABSPATH/.gitconfig ~/.gitconfig
ln -s $ABSPATH/.hushlogin ~/.hushlogin
ln -s $ABSPATH/.nvim/ ~/.config/nvim
ln -s $ABSPATH/.zshrc ~/.zshrc
ln -s $ABSPATH/.ripgreprc ~/.ripgreprc

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string $ABSPATH
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
