#!/bin/bash
shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Global virables
export EDITOR="/usr/bin/vim"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

#Aliases
alias cl="clear"
alias off="deactivate"
alias on="python3 -m venv ."
alias in="source bin/activate"

alias .="pwd"
alias ..="cd ../; pwd"
alias ...="cd ../..; pwd;"

alias :q="exit"

alias vim="nvim"
alias proc="btop"
alias sudo="doas"
alias vf="vifm ."
alias cpy="xclip -selection clipboard"
alias fe="fzf --preview 'bat --color=always {}' --no-sort --tmux --height 30% | xargs -r nvim"
alias wtf="echo $PATH | tr ':' '\n' | xargs -I {} ls {}  | fzf --no-sort --tmux --height 30% | xargs man"
alias fh="history | LC_ALL=C awk '{\$1=\"\"; print substr(\$0,2)}' | fzf --tac --no-sort -i --tmux --height 30% | cpy"

alias l="ls"
alias ll="ls -a"
alias lla="ls -all"
alias du="sudo du -h --max-depth=1"

alias fzf="fzf --preview 'bat --color=always {}'" 

alias pacman-rewrite="sudo pacman -Rns --overwrite '*'"
alias pacman-ooverwrite="sudo pacman -Suyy --overwrite '*'"
