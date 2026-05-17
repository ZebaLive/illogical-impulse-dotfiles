-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

--! User
hl.bind("CTRL + SUPER + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"),
    { description = "Edit shell config" })
hl.bind("CTRL + SUPER + ALT + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"),
    { description = "Edit extra keybinds" })

-- Screenshot editor
hl.bind("SUPER + CTRL + S", hl.dsp.global("quickshell:regionScreenshot"),
    { description = "Screen snip + editor (swappy)" })
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))

-- Unbind Super+Q and rebind killactive to Super+Shift+Q
hl.unbind("SUPER + Q")
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close(), { description = "Close window" })

-- Move window to workspace and follow (Super+Shift+Number)
for i = 1, 10 do
    local numberkey = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19}
    hl.bind("SUPER + SHIFT + code:" .. numberkey[i], function()
        hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i) }))
    end, { description = "Move to workspace " .. i })
end

-- Keypad numbers
local keypad_codes = {87, 88, 89, 83, 84, 85, 79, 80, 81, 90}
for i, code in ipairs(keypad_codes) do
    hl.bind("SUPER + SHIFT + code:" .. code, function()
        hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i) }))
    end)
end
