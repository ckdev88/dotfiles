[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xbindkeys
unclutter --timeout 5 &
xset r rate 250 50
exec dwm
