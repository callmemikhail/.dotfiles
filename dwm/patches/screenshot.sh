#!/bin/sh

output='/tmp/%Y-%m-%d-%T-scr.png'

case "$1" in
    --select) scrot "$output" --select --line mode=edge -e 'xclip -selection clipboard -t image/png -i $f' ;;
    --window) scrot "$output" --focussed --border -e 'xclip -selection clipboard -t image/png -i $f' ;;
    *) echo "$1 is not an option" ;;
esac

# notify-send (когда-то сделаю)
