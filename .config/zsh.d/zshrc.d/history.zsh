SAVEHIST=10000
HISTSIZE=10000

# History settings
if [ -z $HISTFILE ]; then
    HISTFILE=$ZDOTDIR/.zsh_history
fi

# history control
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_VERIFY
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# better history navigation, matching currently typed text
autoload -Uz up-line-or-beginning-search; zle -N up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search; zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search