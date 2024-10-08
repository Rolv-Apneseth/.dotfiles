return {
    "echasnovski/mini.animate", -- Animate movements such as cursor and scrolling
    version = "*",
    config = function()
        local mini_animate = require("mini.animate")
        if not mini_animate then
            return
        end

        local cursor_timing =
            mini_animate.gen_timing.exponential({ -- exponential | linear | quadratic
                duration = 100,
                unit = "total", -- total | step
            })

        mini_animate.setup({
            cursor = {
                enable = true,
                timing = cursor_timing,
            },
            scroll = {
                enable = true,
                timing = cursor_timing,
            },
            resize = {
                enable = false,
            },
            open = {
                enable = false,
            },
            close = {
                enable = false,
            },
        })
    end,
}
