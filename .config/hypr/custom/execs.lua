-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Workspace 3 apps
hl.on("hyprland.start", function()
    hl.exec_cmd("steam -silent")
    hl.exec_cmd("discord")
end)
