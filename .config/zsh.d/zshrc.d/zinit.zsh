declare -A ZINIT
export ZINIT[HOME_DIR]="$ZDOTDIR/zinit"
export ZINIT[BIN_DIR]="$ZDOTDIR/zinit/bin"
export ZINIT[ZCOMPDUMP_PATH]="$ZDOTDIR/.zcompdump"
### Added by Zinit's installer
if [[ ! -f "$ZINIT[BIN_DIR]/zinit.zsh" ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$ZINIT[HOME_DIR]" && command chmod g-rwX "$ZINIT[HOME_DIR]"
    command git clone https://github.com/zdharma/zinit "$ZINIT[BIN_DIR]" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$ZINIT[BIN_DIR]/zinit.zsh"
### End of Zinit installer's chunk


#PS1="~ >" # provide a simple prompt till the theme loads
zinit ice wait'!' lucid
zinit ice depth=1; zinit light romkatv/powerlevel10k # official startup


#zinit light zsh-users/zsh-completions

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
   zdharma/fast-syntax-highlighting \
 blockf \
   zsh-users/zsh-completions \
   OMZP::colored-man-pages \
   OMZP::extract \
   OMZP::wd \
 atload"!_zsh_autosuggest_start" \
   zsh-users/zsh-autosuggestions

#zinit wait lucid light-mode for \
#  atinit"zicompinit; zicdreplay" \
#      zsh-users/zsh-syntax-highlighting \

#zinit light zsh-users/zsh-autosuggestions
#zinit light marlonrichert/zsh-autocomplete

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20 # This can be useful when pasting large amount of text in the terminal, to avoid triggering autosuggestion for strings that are too long
ZSH_AUTOSUGGEST_USE_ASYNC=1

#zinit snippet OMZP::colored-man-pages
#zinit snippet OMZP::extract
#zinit snippet OMZP::wd # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/wd

