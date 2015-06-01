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
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U colors && colors

autoload -U colors && colors
PROMPT="%{$fg[white]%}%n%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}%

alias tunnel='ssh -D 1336 -p 443 ramnode'
alias suspend='sudo systemctl suspend'
alias shutdown='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias clean='bleachbit --preset -c && sudo bleachbit --preset -c'
alias vim="stty stop '' -ixoff ; vim"
alias exiftool='/usr/bin/vendor_perl/exiftool'
alias vpnon='sudo systemctl start openvpn@client'
alias vpnoff='sudo systemctl stop openvpn@client'
alias ls='ls --color=auto'
alias mpc='wine ~/.local/share/wineprefixes/mpc/drive_c/Program\ Files\ (x86)/Media\ Player\ Classic/mpc-hc.exe'
alias virtualbox='sudo modprobe vboxdrv && virtualbox'
alias mpv='primusrun mpv --hwdec=vdpau'

ttyctl -f

export PULSE_LATENCY_MSEC=60
export HOME=/home/sinc
export PATH=/usr/lib/ccache/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/depot-tools-git:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/sinc/.gem/ruby/2.1.0/bin 
export CCACHE_DIR=/media/ccache
