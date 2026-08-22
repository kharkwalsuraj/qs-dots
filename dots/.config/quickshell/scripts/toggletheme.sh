#!/usr/bin/env bash

CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$CURRENT" == "'prefer-dark'" ]]; then
    echo "Setting theme to light mode..."

    gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-light"

    plasma-apply-colorscheme MaterialLight


elif [[ "$CURRENT" == "'prefer-light'" ]]; then
    echo "Setting theme to dark mode..."

    gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

    plasma-apply-colorscheme MaterialDark

else
    # Handle "default" / unexpected state
    echo "Current theme is unspecified, switching to dark mode..."

    gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

    plasma-apply-colorscheme MaterialDark
fi

~/.config/matugen/templates/gtk/setup.sh
~/.config/matugen/templates/kde/setup.sh
~/.config/matugen/templates/hypr/setup.sh
~/.config/matugen/templates/kitty/setup.sh
