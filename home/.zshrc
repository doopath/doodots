# Doopath zsh configuration


# Path to your oh-my-zsh installation.
export ZSH="/home/doopath/.oh-my-zsh"
export DOTNET_ROOT=/usr/share/dotnet
export PATH="$PATH:$HOME/FileComparer:$HOME/.local/bin:$HOME/dotnet:$HOME/.local/bin/PasswordManager:$HOME/.local/bin/scripts:/usr/local/bin/VSCode:$DOTNET_ROOT"
export MSBuildSDKsPath="/usr/share/dotnet/sdk/$(dotnet --version)/Sdks"
export AWT_TOOLKIT=MToolkit

export TERM=xterm-256color
export EDITOR=nvim

autoload -U promptinit; promptinit

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Some color scheme
# fpath+=$HOME/.zsh/pure
# prompt pure
# test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)


ZSH_THEME="oxide"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Run zsh
source $ZSH/oh-my-zsh.sh



# Aliases ->

# Git
alias gcl="git clone"
alias grao="git remote add origin"
alias gcm="git commit"
alias gp="git push"
alias ga="git add"
alias gr="git revert"

# DotNet
alias toDoocutor="cd $HOME/Files/Coderpool/CSharp/Doocutor"
alias pubDoocutor="toDoocutor && dotnet publish Doocutor/Doocutor.csproj -c Release -o Publish -r linux-x64"
alias Doocutor="Doocutor -m dynamic -c DoocutorDark"

# Tmux
alias tns="tmux new-session -s"
alias tas="tmux attach -t"

# Transmission-cli
alias td="transmission-daemon"
alias tr="transmission-remote"

# Python
alias p3="python3.10"
alias p3unit="python3.10 -m unittest"
alias ave="source venv/bin/activate"

# Sustem
alias sizehere="du -sh ./*"
alias fcr="$HOME/FileComparer/fc"
alias zsh_reload="zsh ~/.zshrc"
