# Path to oh-my-zsh plugin manager
export ZSH="/home/jswent/.oh-my-zsh"

# Set history size environment variable
export HISTSIZE=1000000000 

# Configure theme 
ZSH_THEME="agnoster"

# Configure plugins 
plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_CUSTOM

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  

# Keymaps 
bindkey '^ ' autosuggest-accept

# Add snap packages to PATH 
PATH=$PATH:/snap/bin 

