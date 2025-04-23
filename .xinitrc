[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xbindkeys & 
unclutter --timeout 3 &
xset r rate 175 75 &
exec openbox-session &
./dwmbar.sh & 
exec dwm
