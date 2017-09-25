#!/bin/sh
git clone --depth=1 https://github.com/octabaka/dotfiles.git ~/dotfiles

# ZSH
ln -s ~/dotfiles/.zshrc ~/.zshrc
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
wget https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh -O ~/.oh-my-zsh/themes/spaceship.zsh-theme

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
mkdir -p ~/.config/mpv
ln -s ~/dotfiles/mpv.conf ~/.config/mpv/mpv.conf
ln -s ~/dotfiles/input.conf ~/.config/mpv/input.conf




# TMUX
#ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

exit 0
