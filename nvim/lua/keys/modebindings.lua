--[[
key - {string} The hotkey string
command - {string} The command
mode - {string} The mode ('n', 'i', 'v', 't')
]]--
function bind_key(mode, key, command, description)
    description = description or ""
    map(mode, key, command, { noremap = true, silent = true, desc = description })
end
