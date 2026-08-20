-- put former exec-once commands inside the func and former exec commands outside
hl.on("hyprland.start", function ()
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("awww-daemon")
end)
