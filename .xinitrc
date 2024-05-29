[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xbindkeys & 
unclutter --timeout 5 &
xset r rate 250 50 &
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
exec openbox-session &
exec dwm  
