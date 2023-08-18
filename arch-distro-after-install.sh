#!/bin/sh
sudo systemctl disable geoclue.service;systemctl mask geoclue.service -l;
sudo pacman -Syu
sudo pacman -S krita gimp falkon librewolf ungoogled-chromium brave-bin firefox neovim alacritty micro gscan2pdf mpv sweethome3d okular xournalpp libreoffice-still dolphin btop meld
