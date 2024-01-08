
pacman -R micro
pacman -Syu
pacman -S gwenview falkon librewolf ungoogled-chromium brave-bin firefox qutebrowser gscan2pdf mpv audacious sweethome3d okular xournalpp libreoffice-still btop 
pacman -S git clang ripgrep vim neovim fzf xplr meld github-cli npm
npm install -g prettier
pacman -S xvkbd

cd ~ && git clone https://git.suckless.org/surf && cd ~/surf && sudo make clean install && sudo rm ~/surf -r 

cd ~ && git clone https://git.suckless.org/st && cd ~/st && sudo make clean install && sudo rm ~/st -r

pacman -S xbindkeys	xorg-xmodmap


mkdir ~/tmp && cd ~/tmp
git clone https://aur.archlinux.org/unclutter-xfixes-git.git && cd unclutter-xfixes-git && makepkg -si 


