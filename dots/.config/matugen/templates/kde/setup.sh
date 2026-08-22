current=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current" == "'prefer-dark'" ]]; then
    plasma-apply-colorscheme MaterialDark
    cp ~/.config/matugen/outputs/kde/kdeglobals-dark ~/.config/kdeglobals
else
    plasma-apply-colorscheme MaterialLight
    cp ~/.config/matugen/outputs/kde/kdeglobals-light ~/.config/kdeglobals
fi

killall xdg-desktop-portal-kde 2>/dev/null
systemctl --user restart plasma-xdg-desktop-portal-kde.service
# TODO : file picker dosent change the theme so i have to restart, I need a better solution
