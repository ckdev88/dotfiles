#!/bin/sh
sudo systemctl disable geoclue.service;systemctl mask geoclue.service -l;
sudo pacman -Syu
sudo pacman -S krita gimp falkon librewolf ungoogled-chromium brave-bin firefox neovim konsole micro nvim vim kate gscan2pdf mpv sweethome3d okular xournalpp libreoffice-still dolphin xplr fzf btop meld github-cli freetube-bin
