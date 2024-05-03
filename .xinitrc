[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xbindkeys & 
unclutter --timeout 5 &
xset r off &
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
exec openbox-session &
exec dwm  
