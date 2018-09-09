#!/bin/sh
git clone --depth=1 https://github.com/octabaka/dotfiles.git ~/dotfiles

# ZSH
ln -s ~/dotfiles/.zshrc ~/.zshrc

mkdir ~/.zfunctions
ln -s ~/dotfiles/pure.zsh ~/.zfunctions/prompt_pure_setup
ln -s ~/dotfiles/async.zsh ~/.zfunctions/asyncln -s "$PWD/async.zsh" /usr/local/share/zsh/site-functions/async

# VIM
#mkdir -p ~/.vim/colors
#mkdir -p ~/.vim/bundle
#git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#ln -s ~/dotfiles/.vimrc ~/.vimrc
#ln -s ~/dotfiles/octa.vim ~/.vim/colors/octa.vim
#vim +PluginInstall +qall

# NVIM
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
ln -s ~/dotfiles/.nvimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/octa.vim ~/.config/nvim/colors/octa.vim
nvim +PlugInstall +qall

# MPV
# mkdir -p ~/.config/mpv
# ln -s ~/dotfiles/mpv.conf ~/.config/mpv/mpv.conf
# ln -s ~/dotfiles/input.conf ~/.config/mpv/input.conf




# TMUX
#ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

exit 0
