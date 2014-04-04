#!/usr/bin/env bash
ZSH=$HOME/.oh-my-zsh

git clone git://github.com/afc163/dotfiles.git dotfiles
cd dotfiles

cp -f gitconfig $HOME/.gitconfig
cp -f afc163.zsh-theme $ZSH/themes/
cp -f vimrc $HOME/.vimrc
cp -f zshrc $HOME/.zshrc
