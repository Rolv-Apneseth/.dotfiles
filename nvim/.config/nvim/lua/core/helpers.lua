M = {}

M.require_plugin = function(plugin_name)
    local status_ok, plugin = pcall(require, plugin_name)

    if not status_ok then
        vim.notify("Could not find plugin " .. plugin_name)
        return
    end

    return plugin
end

return M
