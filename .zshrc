# Path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

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
plugins=(sudo tmux history autojump common-aliases systemd encode64)

# Set path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/games:/usr/bin/core_perl:$HOME/bin"

# Source config file
source $ZSH/oh-my-zsh.sh

# Set language environment
export LANG=en_US.UTF-8

# Set up Go environment
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Enable command completion
autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

# Allow arrow key control of completions
zstyle ':completion:*' menu select

# Find any new executables in path
zstyle ':completion:*' rehash true

## Aliases
alias rec='LC_ALL=en_US.UTF-8 asciinema rec'
alias ls='ls --color'
alias vim="stty stop '' -ixoff ; vim"
alias mirror='wget -p -k -H -P ~/Mirrored/ -e robots=off'
alias web-perms='sudo chown -R www-data:www-data /var/www/ && sudo chmod -R 775 /var/www/'
alias portcheck='sudo lsof -i -P -n | grep LISTEN'
alias wg='sudo wg'
alias wg-quick='sudo wg-quick'
alias share='nc blaming.me 3001'

## Functions
# check the current weather
weather (){
        curl wttr.in/$1
}

# monitor and log dropped pings to a host
pinglog (){
 if [ "$#" -ne 2 ]; then
        echo "Usage: pinglog <address> <account>"
        exit
 fi
 pinghost="$1"
 account="$2"
 ping -O "$pinghost" 2>&1 | while read pong; do echo "$(date): $pong" | tee -a "$account".log;done
}

# generate thumbnails of all JPGs in a directory
thumbnail() {
        find . ! -name "*_thumb*" -type f -iname "*.JPG" -execdir sh -c "if [ ! -f {}_thumb.JPG ]; then convert -resize 800x800 {} {}_thumb.JPG;fi" -- ';'
}

# regenerate photofloat galleries
gallery-regen() {
        $HOME/scanner/main.py /var/www/html/cdn.seedno.de/pics/albums /var/www/html/cdn.seedno.de/pics/cache
}

# ratelimited recursive download
friendly-download() {
        wget --limit-rate=100k -m -np -c -w 5 -R "index.html*" "$1"
}

# run ansible playbooks
update() {
        # if no arguments are provided, list all existing playbooks
        if [ "$#" -eq 0 ]; then
                echo -e "\nAvailable playbooks:"
                find ~/ansible/*.yml -type f -printf '%f\n' | sed 's/\.yml$//'
                echo -e ""
                exit 1
        fi

        # create array of arguments
        todo=( "$@" )

        # iterate through the array, running playbooks if they exist
        for playbook in "${todo[@]}"; do
                if [ -f ~/ansible/"$playbook".yml ]; then
                        ansible-playbook ~/ansible/"$playbook".yml --vault-password-file=~/ansible/vault.txt
                else
                        echo "Playbook $playbook.yml does not exist"
                fi
        done
}

# Enable syntax highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
