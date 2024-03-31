local require_plugin = require("core.helpers").require_plugin

return {
    "mfussenegger/nvim-dap",
    event = "LspAttach",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap = require_plugin("dap")
        local dap_ui = require_plugin("dapui")
        local dap_virtual_text = require_plugin("nvim-dap-virtual-text")
        if not dap or not dap_ui or not dap_virtual_text then
            return
        end

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "/usr/bin/codelldb",
                args = { "--port", "${port}" },
            },
        }
        dap.configurations.rust = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/" .. "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }

        dap_ui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dap_ui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dap_ui.close()
        end
        dap.listeners.after.event_exited["dapui_config"] = function()
            dap_ui.close()
        end

        dap_virtual_text.setup({
            enabled = true,
            enabled_commands = false, -- create commands e.g. DapVirtualTextEnable
            highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true, -- show stop reason when stopped for exceptions
            commented = false, -- prefix virtual text with comment string
            only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
            all_references = false, -- show virtual text on all all references of the variable (not only definitions)
        })

        -- Customise symbols
        vim.fn.sign_define("DapBreakpoint", {
            text = "",
            texthl = "DiagnosticHint",
            numhl = "DiagnosticHint",
        })
        vim.fn.sign_define("DapBreakpointCondition", {
            text = "",
            texthl = "DiagnosticHint",
            numhl = "DiagnosticHint",
        })
        vim.fn.sign_define("DapBreakpointRejected", {
            text = "",
            texthl = "DiagnosticError",
            numhl = "DiagnosticError",
        })
        vim.fn.sign_define("DapLogPoint", {
            text = "",
            texthl = "DiagnosticInfo",
            numhl = "DiagnosticInfo",
        })
        vim.fn.sign_define("DapStopped", {
            text = "",
            texthl = "DiagnosticInfo",
            numhl = "DiagnosticInfo",
        })
    end,
}
