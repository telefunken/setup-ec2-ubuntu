#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

sudo apt-get install -y git-core
sudo apt-get install gitk

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/telefunken/setup-dotfiles.git
ln -sb setup-dotfiles/.screenrc .
ln -sb setup-dotfiles/.bash_profile .
ln -sb setup-dotfiles/.bashrc .
ln -sf setup-dotfiles/.emacs.d .
ln -sf setup-dotfiles/.inputrc .
ln -sf setup-dotfiles/.gitconfig .

