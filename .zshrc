# Path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# Attach to tmux session
#existing_sessions=$(tmux list-sessions | head -n1 | cut -d ":" -f 1)
#if [ -z "$existing_sessions" ]
#  then
#    tmux >/dev/null 2>&1
#  else
#    tmux new-session -t $existing_sessions >/dev/null 2>&1
#fi

# Disable auto-updates
DISABLE_AUTO_UPDATE=true

# Set history config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000000

# Theme
ZSH_THEME="fishy"

# Ignore duplicate lines in history
setopt HIST_IGNORE_DUPS

# Allow autocompletion of alias switches
setopt completealiases

# Autocorrect commands
ENABLE_CORRECTION="true"

# Select which plugins to load
plugins=(sudo tmux history zsh-completions autojump common-aliases systemd docker encode64)

# Set path
export PATH="/snap/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/games:/usr/bin/core_perl"

# Source config file
source $ZSH/oh-my-zsh.sh

# Set language environment
export LANG=en_US.UTF-8

# Set up Go environment
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Enable command completion
autoload -U compinit
compinit

# Allow arrow key control of completions
zstyle ':completion:*' menu select

# Find any new executables in path
zstyle ':completion:*' rehash true

# Preferred editor for local (vim) and remote (nano) sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi

## Aliases
# colourised ls
alias ls='ls --color'
# fix scroll lock shortcuts for vim
alias vim="stty stop '' -ixoff ; vim"
# set permissions for shared folders
alias web-perms='sudo chown -R www-data:www-data /var/www/html && sudo chmod -R 775 /var/www/html'
# ssh via gate as jump host
alias sshj='ssh -t gate ssh -t'
# view ports and the processes they are bound to
alias portcheck='sudo lsof -i -P -n | grep LISTEN'

# function to generate thumbnails of all JPGs in a directory
thumbnail() {
 find . ! -name "*_thumb*" -type f -iname "*.JPG" -execdir sh -c "if [ ! -f {}_thumb.JPG ]; then convert -resize 800x800 {} {}_thumb.JPG;fi" -- ';'
}

# function for basic timestamped host pings
pinglog (){
 if [ "$#" -ne 2 ]; then
        echo "Usage: pinglog <address> <account>"
        exit
 fi
 pinghost="$1"
 account="$2"
 ping -O "$pinghost" 2>&1 | while read pong; do echo "$(date): $pong" | tee -a "$account".log;done
}

# Enable syntax highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
