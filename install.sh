#!/bin/sh

mkdir -p ~/.vim/colors
#mkdir -p ~/.vim/bundle
#git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth=1 https://github.com/octabaka/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/octa.vim ~/.vim/colors/octa.vim
#ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc
#mkdir ~/.zfunctions
#ln -s ~/dotfiles/pure.zsh ~/.zfunctions/prompt_pure_setup
#ln -s ~/dotfiles/async.zsh ~/.zfunctions/async
ln -s ~/dotfiles/mpv.conf ~/.config/mpv/mpv.conf
ln -s ~/dotfiles/input.conf ~/.config/mpv/input.conf

vim +PluginInstall +qall

#python ~/.vim/bundle/install.py --system-boost --tern-completer



exit 0
