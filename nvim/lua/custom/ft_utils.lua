-- lua/custom/utils/ftplugins.lua
local M = {}

local lazy_load

function M.load_ft(plugins)
    if plugins == nil then
        vim.notify("[ftplugins] No plugins specified", vim.log.levels.WARN)
        return false
    end

   local to_load = type(plugins) == 'string' and {plugins} or plugins
    if not lazy_load then
        if not package.loaded['lazy'] then
            vim.notify("[ftplugins] Lazy.nvim not loaded", vim.log.levels.ERROR)
            return false
        end
        lazy_load = require('lazy').load
    end
    vim.schedule(function()
        local ok, err = pcall(lazy_load, { plugins = to_load })
        if not ok then
            vim.notify("[ftplugins] Load failed: " .. err, vim.log.levels.ERROR)
        end
    end)

    return true
end

return M
