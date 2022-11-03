M = {}

M.require_plugin = function(plugin_name)
    local status_ok, plugin = pcall(require, plugin_name)

    if not status_ok then
        vim.notify("Could not find plugin " .. plugin_name)
        return
    end

    return plugin
end

M.get_listed_buffers = function()
    local buffers = {}
    local len = 0
    for buffer = 1, vim.fn.bufnr("$") do
        if vim.fn.buflisted(buffer) == 1 then
            len = len + 1
            buffers[len] = buffer
        end
    end

    return buffers
end

return M
