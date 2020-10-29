# Do following if interactive
if [[ $- != *i* ]]; then
	return
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh.d/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export SHELL=/bin/zsh
export EDITOR="micro"
export VISUAL="micro"
#export EDITOR="kak"
#export VISUAL="kak"
export BROWSER="firefox-nightly"
#export PAGER=less # this breaks the bat
export TERMINAL='/usr/bin/kitty'
export MICRO_TRUECOLOR=1
#export LS_COLORS="$(vivid generate molokai)"

export PATH
path+=('/home/varafel/.config/zsh.d/zinit/bin')
path+=('/home/varafel/.cargo/bin')

source $ZDOTDIR/zshrc.d/aliases.zsh
source $ZDOTDIR/zshrc.d/zinit.zsh
source $ZDOTDIR/zshrc.d/p10k.zsh
source $ZDOTDIR/zshrc.d/nnn.zsh
source $ZDOTDIR/zshrc.d/vimmode.zsh
source $ZDOTDIR/zshrc.d/history.zsh
source $ZDOTDIR/zshrc.d/options.zsh
source $ZDOTDIR/zshrc.d/completions.zsh
source $ZDOTDIR/zshrc.d/fzf.zsh

# zoxide autostart
unalias zi # zi is an alias used by zinit, unbind it first
eval "$(zoxide init zsh)"


# sk invokes filename search,
# skim invokes file content search
export SKIM_DEFAULT_COMMAND="rg --files || fd || find ."
alias skim='sk --ansi -i -c 'rg --color=always --line-number "{}"''


zmodload -i zsh/complist # menu completion
# autoload -U promptinit && promptinit  # enables advanced prompts



# Usage:
#   In the middle of the command line:
#     (command being typed)<TAB>(resume typing)
#
#   At the beginning of the command line:
#     <SPACE><TAB>
#     <SPACE><SPACE><TAB>
#
# Notes:
#   This does not affect other completions
#   If you want 'cd ' or './' to be prepended, write in your .zshrc 'export TAB_LIST_FILES_PREFIX'
#   I recommend to complement this with push-line-or edit (bindkey '^q' push-line-or-edit)
function tab_list_files
{
  if [[ $#BUFFER == 0 ]]; then
    BUFFER="ls "
    CURSOR=3
    zle list-choices
    zle backward-kill-word
  elif [[ $BUFFER =~ ^[[:space:]][[:space:]].*$ ]]; then
    BUFFER="./"
    CURSOR=2
    zle list-choices
    [ -z ${TAB_LIST_FILES_PREFIX+x} ] && BUFFER="  " CURSOR=2
  elif [[ $BUFFER =~ ^[[:space:]]*$ ]]; then
    BUFFER="cd "
    CURSOR=3
    zle list-choices
    [ -z ${TAB_LIST_FILES_PREFIX+x} ] && BUFFER=" " CURSOR=1
  else
    BUFFER_=$BUFFER
    CURSOR_=$CURSOR
    zle expand-or-complete || zle expand-or-complete || {
      BUFFER="ls "
      CURSOR=3
      zle list-choices
      BUFFER=$BUFFER_
      CURSOR=$CURSOR_
    }
  fi
}

zle -N tab_list_files
bindkey '^I' tab_list_files

# uncomment the following line to prefix 'cd ' and './' 
# when listing dirs and executables respectively
#export TAB_LIST_FILES_PREFIX

# uncomment the following line to complement tab_list_files with ^q
#bindkey '^q' push-line-or-edit


#exp_alias() # expand aliases to the left (if any) before inserting the key pressed
#{ # expand aliases
#	zle _expand_alias
#	zle self-insert
#}; zle -N exp_alias

autoload -Uz compinit
compinit

