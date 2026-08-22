#!/usr/bin/env bash

# echo "Seting up qt colors"

current=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current" == "'prefer-dark'" ]]; then
  cp ~/.config/matugen/outputs/kde/kdeglobals-dark ~/.config/kdeglobals
  plasma-apply-colorscheme MaterialDark
else
  cp ~/.config/matugen/outputs/kde/kdeglobals-light ~/.config/kdeglobals
  plasma-apply-colorscheme MaterialLight
fi

# TODO : file picker dosent change the theme so i have to restart, I need a better solution
killall xdg-desktop-portal-kde 2>/dev/null
systemctl --user restart plasma-xdg-desktop-portal-kde.service
