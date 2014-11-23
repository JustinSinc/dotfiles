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

PROMPT='%m %~ %# '

alias socks='urxvt -e ssh -D 1336 -p 443 root@192.184.82.89 & /usr/sbin/chromium --proxy-server="socks5://localhost:1336" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost"'
alias tunnel='ssh -D 1336 -p 443 root@server'
alias suspend='sudo systemctl suspend'
alias shutdown='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias clean='bleachbit --preset -c && sudo bleachbit --preset -c'
alias vim="stty stop '' -ixoff ; vim"
alias exiftool='/usr/bin/vendor_perl/exiftool'
alias vpnon='sudo systemctl start openvpn@client'
alias vpnoff='sudo systemctl stop openvpn@client'
alias ls='ls --color=auto'
alias mv='mv'
alias rm='rm'
alias mpc='wine ~/.local/share/wineprefixes/mpc/drive_c/Program\ Files\ (x86)/Media\ Player\ Classic/mpc-hc.exe'
alias hostlist='sudo nmap -sn'
alias virtualbox='sudo modprobe vboxdrv && virtualbox'
alias mantaray='cd /media/Vagrant/mantaray && vagrant up && vagrant ssh -- -Y'
alias scribes='scribes > /dev/null 2>&1'

ttyctl -f

export PULSE_LATENCY_MSEC=60
export HOME=/home/sinc
export PATH=/usr/lib/ccache/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/depot-tools-git:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/sinc/.gem/ruby/2.1.0/bin 
export CCACHE_DIR=/media/ccache
