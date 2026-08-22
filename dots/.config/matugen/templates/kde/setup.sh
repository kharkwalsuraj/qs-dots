#!/usr/bin/env bash
mode="${1,,}"   # force lowercase

if [[ "$mode" == "dark" ]]; then
  cp ~/.config/matugen/outputs/kde/kdeglobals-dark ~/.config/kdeglobals
  plasma-apply-colorscheme MaterialDark
else
  cp ~/.config/matugen/outputs/kde/kdeglobals-light ~/.config/kdeglobals
  plasma-apply-colorscheme MaterialLight
fi

# Restart portal so file picker etc. pick up the new scheme
killall xdg-desktop-portal-kde 2>/dev/null
systemctl --user restart plasma-xdg-desktop-portal-kde.service 2>/dev/null || true
