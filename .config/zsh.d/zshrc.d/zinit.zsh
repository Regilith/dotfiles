declare -A ZINIT
export ZINIT[HOME_DIR]="$ZDOTDIR/zinit"
export ZINIT[BIN_DIR]="$ZDOTDIR/zinit/bin"
export ZINIT[ZCOMPDUMP_PATH]="$ZDOTDIR/.zcompdump"

source $ZDOTDIR/zinit/bin/zinit.zsh
#autoload -Uz _zinit
#(( ${+_comps} )) && _comps[zinit]=_zinit

## TODO: implement turbo mode
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

