# vim mode config
# ---------------
# Activate vim mode.
bindkey -v

# Remove mode switching delay.
KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup & each new prompt.
#_fix_cursor() {
#    echo -ne '\e[5 q'
#}
#precmd_functions+=(_fix_cursor)

# Use beam shape cursor on startup & each new prompt.
echo -ne '\e[5 q'
zle-line-init() {
    echo -ne "\e[5 q"
}