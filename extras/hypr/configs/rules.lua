-- --- Window Rules ---

hl.config({
    windowrule = {
        -- Dialogs & File Pickers
        "center, title:^(Open File)(.*)$",
        "float, title:^(Open File)(.*)$",
        "center, title:^(Select a File)(.*)$",
        "float, title:^(Select a File)(.*)$",
        "center, title:^(Choose wallpaper)(.*)$",
        "float, title:^(Choose wallpaper)(.*)$",
        "center, title:^(Open Folder)(.*)$",
        "float, title:^(Open Folder)(.*)$",
        "center, title:^(Save As)(.*)$",
        "float, title:^(Save As)(.*)$",
        "center, title:^(Library)(.*)$",
        "float, title:^(Library)(.*)$",
        "center, title:^(File Upload)(.*)$",
        "float, title:^(File Upload)(.*)$",

        -- System Tools
        "float, class:^(pavucontrol)$",
        "center, class:^(pavucontrol)$",
        "size (monitor_w*.45) (monitor_h*.45), class:^(pavucontrol)$",
        "float, class:^(nm-connection-editor)$",
        "center, class:^(nm-connection-editor)$",
        "size (monitor_w*.45) (monitor_h*.45), class:^(nm-connection-editor)$",

        -- Portals
        "float, class:org.freedesktop.impl.portal.desktop.kde",
        "float, class:xdg-desktop-portal-gtk",
        "float, class:xdg-desktop-portal-hyprland",

        -- Picture-in-Picture
        "float, title:^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
        "pin, title:^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",

        -- NAnDoroid Panels (Native Floating)
        "float, title:^(Settings)$",
        "center, title:^(Settings)$",
        "float, title:^(System Monitor)$",
        "center, title:^(System Monitor)$"
    }
})