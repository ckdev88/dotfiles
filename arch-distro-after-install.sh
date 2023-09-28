#!/bin/sh
#systemctl disable geoclue.service;systemctl mask geoclue.service -l;
pacman -R micro
pacman -Syu
pacman -S krita gimp gwenview falkon librewolf ungoogled-chromium brave-bin firefox gscan2pdf mpv audacious sweethome3d okular xournalpp libreoffice-still btop 
pacman -S git clang ripgrep vim neovim kate fzf xplr meld konsole github-cli npm
npm install -g prettier
