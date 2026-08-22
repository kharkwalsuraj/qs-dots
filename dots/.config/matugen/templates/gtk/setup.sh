#!/usr/bin/env bash

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
    cp ~/.config/matugen/outputs/gtk/dark/colors3.css ~/.config/gtk-3.0/colors.css
    cp ~/.config/matugen/outputs/gtk/dark/colors4.css ~/.config/gtk-4.0/colors.css
else
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    cp ~/.config/matugen/outputs/gtk/light/colors3.css ~/.config/gtk-3.0/colors.css
    cp ~/.config/matugen/outputs/gtk/light/colors4.css ~/.config/gtk-4.0/colors.css
fi
