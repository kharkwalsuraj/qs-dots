#!/usr/bin/env bash
mode="${1,,}"   # force lowercase

# Ensure the import lines exist
for file in \
  "$HOME/.config/gtk-4.0/gtk.css" \
  "$HOME/.config/gtk-3.0/gtk.css" \
  "$HOME/.config/gtk-3.0/gtk-dark.css"
do
  grep -qxF '@import "colors.css";' "$file" 2>/dev/null || echo '@import "colors.css";' >> "$file"
done

gsettings set org.gnome.desktop.interface gtk-theme 'Darkly'

if [[ "$mode" == "dark" ]]; then
  gsettings set org.gnome.desktop.interface icon-theme "breeze-dark"
  gsettings set org.gnome.desktop.interface color-scheme prefer-light
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
  gsettings set org.gnome.desktop.interface icon-theme "breeze"
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  gsettings set org.gnome.desktop.interface color-scheme prefer-light
fi
