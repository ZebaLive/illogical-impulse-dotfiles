-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Load nwg-displays generated configs
require("custom.nwg_displays")

hl.config({
    input = {
        accel_profile = "flat",
        force_no_accel = true,
        kb_layout = "us,lt",
        kb_options = "grp:alt_shift_toggle",
        repeat_delay = 350,
    },
})
