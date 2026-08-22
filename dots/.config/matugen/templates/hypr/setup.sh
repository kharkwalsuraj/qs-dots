current=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current" == "'prefer-dark'" ]]; then
    cp ~/.config/matugen/outputs/hypr/colors.dark.lua ~/.config/hypr/config/colors.lua
else
    cp ~/.config/matugen/outputs/hypr/colors.light.lua ~/.config/hypr/config/colors.lua
fi

hyprctl reload
