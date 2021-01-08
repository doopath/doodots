# Doopath zsh configuration


# Path to your oh-my-zsh installation.
export ZSH="/home/doopath/.oh-my-zsh"
export PATH="$PATH:/home/doopath/bin"

# Pythonpaht settings
export PYTHONPATH=${PYTHONPATH}:${HOME}/Files/coderpool/Python/doondler:${HOME}/Files/coderpool/Python/doondler/test

autoload -U promptinit; promptinit

# Some color scheme
# fpath+=$HOME/.zsh/pure
# prompt pure
# test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

ZSH_THEME="minimal"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"


# Aliases ->

# Git
alias gcl="git clone"
alias grao="git remote add origin"
alias gc="git commit"
alias gp="git push"
alias ga="git add"
alias gr="git revert"

# Sustem
alias sizehere="du -sh ./*"

# Apps
alias pycharm="sh /opt/pycharm-community-2020.3.2/bin/pycharm.sh"

