#!/usr/bin/env bash

file="$HOME/.config/gtk-4.0/gtk.css"

if ! grep -qxF '@import "colors.css";' "$file" 2>/dev/null; then
    printf '%s\n' '@import "colors.css";' >> "$file"
fi

gsettings set org.gnome.desktop.interface gtk-theme 'Darkly'

current=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ "$current" == "'prefer-dark'" ]]; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
fi
