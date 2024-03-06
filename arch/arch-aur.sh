pacman -R micro
pacman -Syu
pacman -S lynx ungoogled-chromium firefox qutebrowser mpv 
pacman -S git clang ripgrep vim neovim fzf github-cli yarn xclip
yarn add --global prettier


cd ~ && git clone https://git.suckless.org/dwm cd ~/dwm && sudo make clean install && sudo rm -rf  ~/dwm -r 
cd ~ && git clone https://git.suckless.org/st && cd ~/st && sudo make clean install && sudo rm ~/st -r

pacman -S xbindkeys	xorg-xmodmap


mkdir ~/tmp && cd ~/tmp
git clone https://aur.archlinux.org/unclutter-xfixes-git.git && cd unclutter-xfixes-git && makepkg -si 


# xbindkeys
pacman -S guile world/guile2.2 
mkdir ~/tmp && cd ~/tmp &&
git clone git://git.savannah.nongnu.org/xbindkeys.git/ && cd xbindkeys && ./configure && make && make install && cd ~/tmp && rm -rf xbindkeys && 
echo '
"pactl set-sink-volume @DEFAULT_SINK@ +5%"
XF86AudioRaiseVolume

"pactl set-sink-volume @DEFAULT_SINK@ -5%"
XF86AudioLowerVolume

"pactl set-sink-mute @DEFAULT_SINK@ toggle"
XF86AudioMute
' >> ~/.xbindkeysrc

# --------------------------------------


yay -S live-server
yay -S ungoogled-chromium-bin
yay -S rsync

yay -S python-pip
sudo pacman -S python-pipx
