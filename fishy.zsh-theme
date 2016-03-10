# ZSH Theme emulating the Fish shell's default prompt.

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe "
   BEGIN {
      binmode STDIN,  ':encoding(UTF-8)';
      binmode STDOUT, ':encoding(UTF-8)';
   }; s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g
")
}

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
PROMPT="%{$fg[white]%}%n%\%{$fg[blue]%}@%{$reset_color%}%{$fg[white]%}%m%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}%"
local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"

