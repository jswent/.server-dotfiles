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
if [ -d ~/.oh-my-zsh ]
then 
  echo "oh-my-zsh was found on this system, skipping install..."
else
  echo "oh-my-zsh was not found on this system, installing now..."
  curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh 

  # verify installation was successful
  if [ -d ~/.oh-my-zsh ]
  then 
    echo "oh-my-zsh was successfully installed"
  else 
    echo "oh-my-zsh failed to install, please re-run script"
    exit 1
  fi 
fi

# check required plugins are installed



