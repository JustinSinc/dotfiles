# Path to oh-my-zsh installation.
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
plugins=(sudo tmux web-search history zsh-completions autojump common-aliases 
rand-quote systemd)

# Set path
export PATH="/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/bin/core_perl"

# Source config file
source $ZSH/oh-my-zsh.sh

# Set language environment
export LANG=en_US.UTF-8

# Set up Go environment
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Correct improperly entered commands
eval "$(thefuck --alias nope)"

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

# Aliases
alias vpnon='sudo systemctl start openvpn@lasciel'
alias vpnoff='sudo systemctl stop openvpn@lasciel'
alias suspend='sudo systemctl suspend'
alias shutdown='sudo systemctl poweroff'
alias rec='LC_ALL=en_US.UTF-8 asciinema rec'
alias clean='bleachbit --preset -c && sudo bleachbit --preset -c'
alias vim="stty stop '' -ixoff ; vim"
alias mpv='mpv --hwdec=vdpau'
alias mpchc='wine "~/.wine/drive_c/Program Files (x86)/MPC-HC/mpc-hc.exe"'
alias syncmusic='rsync -av -u -h --ignore-existing --delete --no-perms --no-owner --no-group -e "ssh -p 443" --partial gate:/Music ~/'
alias ansible-aptget='ssh -t gate "cd ~/ansible && ansible-playbook -f4 aptget.yml --ask-sudo-pass"'
alias ansible-ntp='ssh -t gate "cd ~/ansible && ansible-playbook -f4 ntp.yml --ask-sudo-pass"'
alias update='sudo pacman -Syu'
alias subsonic='ssh -t gate ssh subsonic'
alias intranet='ssh -t gate ssh intranet'
alias virt1='ssh -t gate ssh virt1'
alias virt2='ssh -t gate ssh virt2'
alias virt3='ssh -t gate ssh virt3'
alias utility='ssh -t gate ssh utility'
alias seedhost='ssh -t gate ssh seedhost'
alias vpn='ssh -t gate ssh vpn'
alias dhcp='ssh -t gate ssh dhcp'
alias storage='ssh -t gate ssh storage'
alias share='ssh -t gate ssh share'
alias gate='ssh gate'

# Enable syntax highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
