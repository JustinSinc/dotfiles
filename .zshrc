# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000000
setopt appendhistory autocd extendedglob notify
setopt inc_append_history
setopt share_history
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sinc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%~ %# '

alias suspend='sudo systemctl suspend'
alias shutdown='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias clean='bleachbit --preset -c && sudo bleachbit --preset -c'
alias vim="stty stop '' -ixoff ; vim"
alias exiftool='/usr/bin/vendor_perl/exiftool'
alias vpnon='sudo systemctl start openvpn@client'
alias vpnoff='sudo systemctl stop openvpn@client'
alias grep='grep -Hn --color=always'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias mpc='wine ~/.local/share/wineprefixes/mpc/drive_c/Program\ Files\ (x86)/Media\ Player\ Classic/mpc-hc.exe'
alias hostlist='sudo nmap -sn'
alias virtualbox='sudo modprobe vboxdrv && virtualbox'
alias mantaray='cd /media/Vagrant/mantaray && vagrant up && vagrant ssh -- -Y'

ttyctl -f

export PULSE_LATENCY_MSEC=60
