return {
    "David-Kunz/gen.nvim",
    opts = {
        model = "code",         -- The default model to use.
        display_mode = "float", -- The display mode. Can be "float" or "split".
        show_prompt = false,    -- Shows the Prompt submitted to Ollama.
        show_model = false,     -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = true,   -- Never closes the window automatically.
        debug = false,          -- Prints errors and the command which is run.
        -- Function to initialize Ollama
        init = function()
            pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
        end,
        -- The command for the Ollama service
        command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
    },
    lazy = true,
    keys = {
        {
            "<leader>a",
            ":Gen<CR>",
            mode = { "n", "v" },
            desc = "Gen.nvim",
        },
    },
}
