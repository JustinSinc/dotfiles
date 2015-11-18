# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set history config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000000

# Set terminal theme
ZSH_THEME="fishy"

# Autocorrect commands
ENABLE_CORRECTION="true"

# Select which plugins to load
plugins=(git sudo tmux web-search history)

# Set path
export PATH="/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/games"

# Source config file
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Correct improperly entered commands
eval "$(thefuck --alias nope)"

# Syntax highlighting for the shell
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Preferred editor for local (vim) and remote (nano) sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi
