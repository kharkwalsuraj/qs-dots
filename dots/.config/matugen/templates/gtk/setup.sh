#!/usr/bin/env bash

# echo "Seting up gtk3/4 colors"

file="$HOME/.config/gtk-4.0/gtk.css"
grep -qxF '@import "colors.css";' "$file" 2>/dev/null || echo '@import "colors.css";' >> "$file"

file="$HOME/.config/gtk-3.0/gtk.css"
grep -qxF '@import "colors.css";' "$file" 2>/dev/null || echo '@import "colors.css";' >> "$file"

file="$HOME/.config/gtk-3.0/gtk-dark.css"
grep -qxF '@import "colors.css";' "$file" 2>/dev/null || echo '@import "colors.css";' >> "$file"

gsettings set org.gnome.desktop.interface gtk-theme 'Darkly'

current=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ "$current" == "'prefer-dark'" ]]; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
fi
