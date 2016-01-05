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

# Aliases
alias vpnon='sudo systemctl start openvpn@lasciel'
alias vpnoff='sudo systemctl stop openvpn@lasciel'
alias tunnel='ssh -D 1336 gate'
alias suspend='sudo systemctl suspend'
alias shutdown='sudo systemctl poweroff'
alias clean='bleachbit --preset -c && sudo bleachbit --preset -c'
alias vim="stty stop '' -ixoff ; vim"
alias mpv='mpv --hwdec=vdpau'
alias mpc='wine "/home/sinc/.wine/drive_c/Program Files (x86)/MPC-HC/mpc-hc.exe"'
alias games='ssh -t gate ssh games'
alias subsonic='ssh -t gate ssh subsonic'
alias mine='ssh -t gate ssh mine'
alias intranet='ssh -t gate ssh intranet'
alias virt1='ssh -t gate ssh virt1'
alias virt2='ssh -t gate ssh virt2'

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
