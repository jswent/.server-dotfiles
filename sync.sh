#!/bin/bash

# check if ZSH is installed
if grep -q "zsh" "/etc/shells"
then
  echo "ZSH was found on this system, skipping install..."
else 
  echo "ZSH was not found on this system, installing now..."
  sudo apt-get install zsh -y
fi

# check if oh-my-zsh is installed
if [ -d "~/.oh-my-zsh" ]
then 
  echo "oh-my-zsh was found on this system, skipping install"
else
  echo "oh-my-zsh was not found on this system, skipping install..."
  curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh 
fi
