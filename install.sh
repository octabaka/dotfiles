#!/bin/sh

mkdir ~/.vim/
mkdir ~/.vim/colors
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth=1 https://github.com/octabaka/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/octa.vim ~/.vim/colors/octa.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

vim +PluginInstall +qall

python ~/.vim/bundle/install.py --system-boost --tern-completer




exit 0
