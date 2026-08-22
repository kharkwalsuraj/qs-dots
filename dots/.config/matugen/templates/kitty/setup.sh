current=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current" == "'prefer-dark'" ]]; then
    cp ~/.config/matugen/outputs/kitty/colors.dark.conf ~/.config/kitty/colors.conf
else
    cp ~/.config/matugen/outputs/kitty/colors.light.conf ~/.config/kitty/colors.conf
fi

pkill -USR1 kitty
