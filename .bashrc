#!/bin/bash
shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Global virables
export EDITOR="/usr/bin/nvim"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export PATH="$PATH:/home/pressf/.local/bin"
export PATH="$PATH:/home/pressf/packages/.pacman/bin"
export PATH="$PATH:/home/pressf/packages/.pacman/sbin"
export PATH="$PATH:/home/pressf/packages/.pacman/usr/bin"
export PATH="$PATH:/home/pressf/packages/.pacman/usr/sbin"

#Aliases
alias cl="clear"
alias off="deactivate"
alias on="python3 -m venv ."
alias in="source bin/activate"

alias vialias="vim ~/.bashrc && source ~/.bashrc"

alias .="pwd"
alias ..="cd ../; pwd"
alias ...="cd ../..; pwd;"

alias :q="exit"

alias vim="nvim"
alias vf="vifm ."
alias sudo="doas"
alias proc="btop"
alias cpy="xclip -selection clipboard"
alias fh="history | LC_ALL=C awk '{\$1=\"\"; print substr(\$0,2)}' | fzf --tac --no-sort -i --tmux --height 30% | cpy"

alias l="ls"
alias ll="ls -a"
alias lla="ls -all"
alias du="sudo du -h --max-depth=1"

alias fzf="fzf --preview 'bat --color=always {}'" 

alias pacman-rewrite="sudo pacman -Rns --overwrite '*'"
alias pacman-overwrite="sudo pacman -S --overwrite '*'"

#Bindings
if [[ $- == *i* ]]; then
    bind -x '"\C-r": "fh"'
    bind -x '"\ec": "cd $(fzf --tmux --height 30% --walker=dir,hidden,follow)"'
    bind -x '"\C-e": "fzf --preview '\''bat --color=always {}'\'' --no-sort --tmux --height 30% | xargs -r nvim"'
fi
