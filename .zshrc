# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# Set history config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000000

# Theme
ZSH_THEME="fishy"

# Autocorrect commands
ENABLE_CORRECTION="true"

# Select which plugins to load
plugins=(git sudo tmux web-search history zsh-completions)

# Set path
export PATH="/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/games"

# Aliases
alias vpnon='sudo systemctl start openvpn@lasciel'
alias vpnoff='sudo systemctl stop openvpn@lasciel'
alias tunnel='pkill autossh; autossh -M 2050 -f -N -D 1336 gate'
alias suspend='sudo systemctl suspend'
alias shutdown='sudo systemctl poweroff'
alias clean='bleachbit --preset -c && sudo bleachbit --preset -c'
alias vim="stty stop '' -ixoff ; vim"
alias mpv='mpv --hwdec=vdpau'
alias mpchc='wine "/home/sinc/.wine/drive_c/Program Files (x86)/MPC-HC/mpc-hc.exe"'
alias syncmusic='sudo rsync -av -u -h --delete --no-perms --no-owner --no-group -e "ssh -p 443" --partial sinc@justinsinkula.com:/Music ~/'
alias games='ssh -t gate ssh games'
alias subsonic='ssh -t gate ssh subsonic'
alias mine='ssh -t gate ssh mine'
alias intranet='ssh -t gate ssh intranet'
alias virt1='ssh -t gate ssh virt1'
alias virt2='ssh -t gate ssh virt2'
alias office='ssh -t gate ssh office'
alias bros='ssh -t gate ssh bros'
alias utility='ssh -t gate ssh utility'
alias seedhost='ssh -t gate ssh seedhost'
alias vpn='ssh -t gate ssh vpn'
alias router1='ssh -t gate ssh router1'
alias dhcp='ssh -t gate ssh dhcp'
alias storage='ssh -t gate ssh storage'
alias steam='ssh -t gate ssh -t games sudo su - steam'
alias gate='ssh gate'
alias aptget='ssh -t gate "cd ~/ansible && ansible-playbook -f4 aptget.yml --ask-sudo-pass"'

# Source config file
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Correct improperly entered commands
eval "$(thefuck --alias nope)"

# Preferred editor for local (vim) and remote (nano) sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi

# Enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
