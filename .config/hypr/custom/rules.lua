-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Workspace 3 apps
hl.window_rule({match = {class = "^(steam)$", title = "^(Friends List)$" }, workspace = "3"})
hl.window_rule({match = {class = "^(discord)$" }, workspace = "3"})

-- TTC Client (system wine)
hl.window_rule({match = {class = "^(client.exe)$", title = "^(Tamriel Trade Centre Client)$" }, float = true})
hl.window_rule({match = {class = "^(client.exe)$", title = "^(Tamriel Trade Centre Client)$" }, center = true})

-- Force Steam and games to HDMI monitor
-- hl.window_rule({match = {class = "^(steam_app_.*)$" }, monitor = "HDMI-A-1"})
-- hl.window_rule({match = {class = "^(steam_app_.*)$" }, fullscreen = true})
-- hl.window_rule({match = {class = "^(steam_app_.*)$" }, immediate = true})
