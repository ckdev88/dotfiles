[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xbindkeys
unclutter --timeout 5 &
xset r 250 50
exec dwm
