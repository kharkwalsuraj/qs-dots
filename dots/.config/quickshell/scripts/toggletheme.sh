#!/usr/bin/env bash

SCHEME="$1"
CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme)

WALLPAPER=$(awww query | sed -n 's/.*currently displaying: image: //p')

if [[ -z "$WALLPAPER" ]]; then
    echo "Error: Could not determine current wallpaper."
    exit 1
fi

if [[ "$CURRENT" == "'prefer-dark'" ]]; then
    MODE="light"
    echo "Setting theme to light mode..."

    gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
    plasma-apply-colorscheme MaterialLight

elif [[ "$CURRENT" == "'prefer-light'" ]]; then
    MODE="dark"
    echo "Setting theme to dark mode..."

    gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    plasma-apply-colorscheme MaterialDark

else
    MODE="dark"
    echo "Current theme is unspecified, switching to dark mode..."

    gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    plasma-apply-colorscheme MaterialDark
fi

matugen image "$WALLPAPER" -m "$MODE" -t "$SCHEME"
