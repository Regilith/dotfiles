# Aliases
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias dragon='dragon-drag-and-drop --and-exit --all'
alias cp='cp -r --reflink=auto'
alias ex='extract'
alias rm='rmtrash -rf'
alias rg='rg --hidden --follow --smart-case 2>/dev/null'
alias e='kak'

alias l='exa'
alias la='exa -lag --group-directories-first --icons'
#alias ls="lsd --group-dirs first"
#alias ls="ls --color=auto"
#alias ll="ls -l"
#alias la="ll -a"

alias br='broot'

alias yt='youtube-viewer'

alias nordc='nordvpn connect us'
alias nordd='nordvpn disconnect'

alias irssi='irssi --config ~/.config/irssi/config'

alias cpuspeed='watch -n.1 grep \"cpu MHz\" /proc/cpuinfo'

#alias sudo='sudo -E'

alias mirror-update="reflector --verbose -p http -p https -c US -a 24 --score 100 -f 10 --sort rate --save /etc/pacman.d/mirrorlist; rm -f /etc/pacman.d/mirrorlist.pacnew"

alias usb='cd /media && devmon &'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

fuzzy-cd ()
{
  while entries=".."$'\n'"$(ls)" \
        f=$(echo "$entries" | fzf)
  do
    cd "$f" &>/dev/null || xdg-open "$f" >/dev/null 2>&1 
  done
}
