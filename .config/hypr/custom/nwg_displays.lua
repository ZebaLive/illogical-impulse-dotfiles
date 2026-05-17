-- Parses nwg-displays generated monitors.conf & workspaces.conf
-- and applies them using the Hyprland Lua API

local hypr_dir = HOME .. "/.config/hypr/"

local function load_nwg_monitors(path)
    local f = io.open(path, "r")
    if not f then return end
    for line in f:lines() do
        local output, mode, pos, scale = line:match("^monitor=([^,]+),([^,]+),([^,]+),(.+)$")
        if output then
            hl.monitor({ output = output, mode = mode, position = pos, scale = scale })
        end
    end
    f:close()
end

local function load_nwg_workspaces(path)
    local f = io.open(path, "r")
    if not f then return end
    for line in f:lines() do
        local ws, rest = line:match("^workspace=(%d+),(.+)$")
        if ws then
            local rule = { workspace = ws }
            for key, val in rest:gmatch("([^,:]+):([^,]+)") do
                if val == "true" then val = true
                elseif val == "false" then val = false end
                rule[key] = val
            end
            hl.workspace_rule(rule)
        end
    end
    f:close()
end

load_nwg_monitors(hypr_dir .. "monitors.conf")
load_nwg_workspaces(hypr_dir .. "workspaces.conf")
