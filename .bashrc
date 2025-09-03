#!/bin/bash
shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Global virables
export EDITOR="/usr/bin/nvim"
export PATH="$HOME/.local/bin:$PATH"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

#Aliases
alias nx="nsxiv"
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
alias pst="xclip -o -selection clipboard"
alias fh='READLINE_LINE="$(history | awk '\''{$1=""; print substr($0,2)}'\'' | fzf --tac --no-sort -i --height 30%)"; READLINE_POINT=${#READLINE_LINE}'

alias l="ls"
alias ll="ls -a"
alias lla="ls -allhrt"
alias du="doas du -h --max-depth=1"

alias fzf="fzf --preview 'bat --color=always {}'" 

alias pacman-rewrite="doas pacman -Rns --overwrite '*'"
alias pacman-overwrite="doas pacman -Suyy --overwrite '*'"

#Bindings
if [[ $- == *i* ]]; then
    bind -x '"\C-r": "fh"'

    bind -x '"\ec": __fzf_cd_to_dir'
    __fzf_cd_to_dir() {
      local dir
      dir=$(fzf --tmux --height 30% --walker=dir,hidden,follow)
      if [[ -n "$dir" ]]; then
          cd -- "$dir" && echo "Current dir $(pwd)" \
              || echo "Failed to cd into $dir" >&2
      fi
    }
    
    bind -x '"\C-e": __fzf_open_file'
    __fzf_open_file() {
        local file
        file=$(fzf --preview 'bat --color=always {}' --no-sort --tmux --height 60%)
        if [[ -n "$file" ]]; then
            nvim -- "$file"
        fi
    }

    bind -x '"\C-g": fzf_rg_nvim'
    fzf_rg_nvim() {
        local selected arr
        selected=$(rg --hidden --no-ignore --no-ignore-dot --no-ignore-global --line-number --color=always -- . | \
            fzf --ansi \
            --delimiter ':' \
            --nth 1,2,3 \
            --preview 'bat --color=always --highlight-line {2} {1}')

            if [[ -n "$selected" ]]; then
                IFS=: read -ra arr <<< "$selected"
                if (( ${#arr[@]} >= 2 )) && [[ -f "${arr[0]}" ]]; then
                    nvim "+${arr[1]}" "${arr[0]}"
                else
                    echo "Invalid selection format" >&2
                    return 1
                fi
            fi
        }
fi
