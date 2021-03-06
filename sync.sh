#!/bin/bash

## check if ZSH is installed
if grep -q "zsh" "/etc/shells"; then
  echo "ZSH was found on this system, skipping install..."
else 
  echo "ZSH was not found on this system, installing now..."
  sudo apt-get install zsh -y
fi

## check if oh-my-zsh is installed
if [ -d ~/.oh-my-zsh ]; then 
  echo "oh-my-zsh was found on this system, skipping install..."
else
  echo "oh-my-zsh was not found on this system, installing now..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # verify installation was successful
  if [ -d ~/.oh-my-zsh ]; then 
    echo "oh-my-zsh was successfully installed"
  else 
    echo "oh-my-zsh failed to install, please re-run script"
    exit 1
  fi 
fi

## check required plugins are installed

# check zsh-autosuggestions is installed
if [ -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
  echo "zsh-autosuggestions is installed, skipping install..."
else 
  echo "zsh-autosuggestions was not found on this system, installing now"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# check zsh-syntax-highlting is installed 
if [ -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
  echo "zsh-syntax-highlting is installed, skipping install..."
else
  echo "zsh-syntax-highlting was not found on this system, installing now"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# load .zshrc config 
if [ -f ~/.zshrc ]; then
  echo "Existing .zshrc config file found on the system, moving to ~/.zshrc.bak"
  mv ~/.zshrc ~/.zshrc.bak
else
  echo "No .zshrc config file found, downloading from git repo"
fi  

# download .zshrc config
git clone https://github.com/jswent/.server-dotfiles ~/.server-dotfiles-git
mv ~/.server-dotfiles-git/.zshrc ~/.zshrc 

# remove git repo
rm -rf ~/.server-dotfiles-git

## completion of script
echo "All tasks completed successfully."

