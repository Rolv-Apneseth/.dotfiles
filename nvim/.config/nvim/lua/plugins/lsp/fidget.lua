local icons = require("core.icons")

return {
    "j-hui/fidget.nvim", -- LSP progress animations
    tag = "legacy",
    event = "LspAttach",
    opts = {
        window = {
            blend = 0,
        },
        text = {
            spinner = "meter", -- best ones: pipe arc zip bouncing_bar bouncing_ball meter
            done = icons.ui.Check, -- character shown when all tasks are complete
            commenced = icons.ui.Circle, -- message shown when task starts
            completed = icons.ui.Check, -- message shown when task completes
        },
        align = {
            bottom = true, -- align fidgets along bottom edge of buffer
            right = true, -- align fidgets along right edge of buffer
        },
        timer = {
            spinner_rate = 150, -- frame rate of spinner animation, in ms
            fidget_decay = 1000, -- how long to keep around empty fidget, in ms
            task_decay = 1000, -- how long to keep around completed task, in ms
        },
        fmt = {
            leftpad = true, -- right-justify text in fidget box
            stack_upwards = true, -- list of tasks grows upwards
            max_width = 0,
        },
        debug = {
            logging = false, -- whether to enable logging, for debugging
            strict = false, -- whether to interpret LSP strictly
        },
    },
}
