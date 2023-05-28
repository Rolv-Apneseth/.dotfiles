local require_plugin = require("core.helpers").require_plugin

-- Greeter
return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require_plugin("alpha")
        if not alpha then
            return
        end
        local dashboard = require("alpha.themes.dashboard")

        -- Possible headers
        local headers = {
            {
                "",
                "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
                "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
                "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
                "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
                "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
                "",
            },
            -- Kraken
            {
                "",
                "  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ",
                "   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ",
                "         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ",
                "          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   ",
                "         ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ",
                "  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ",
                " ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  ",
                "⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ",
                "⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄",
                "     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    ",
                "      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ",
                "",
            },
            -- Balrog
            {
                "",
                " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                " ⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢀⣤⣴⣶⣿⣿⣾⣶⣤⣀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀",
                " ⠀⠀⠀⠀⠀⢠⣤⡤⣾⠶⠾⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢲⣶⢤⣤⣄⠀⠀⠀⠀⠀",
                " ⠀⠀⠀⢰⣾⣾⣿⣷⣾⣧⣤⡀⠙⢿⡿⢿⡿⢿⡿⠋⢀⣤⣼⣧⣾⣾⣵⣷⣆⠀⠀⠀",
                " ⠀⠀⣶⣿⣿⣿⣿⠿⠛⠉⢹⣿⣶⣵⣎⣯⣽⣡⣮⣶⣿⡇⠈⠻⠿⢿⣿⣿⣿⣷⡀⠀",
                " ⠀⣼⣿⣿⡟⠁⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠈⣻⣿⣿⣷⠀",
                " ⢰⣿⣿⣿⠇⠀⠀⠀⠀⢠⠘⢣⣾⡿⣿⣿⣿⢿⠿⣶⡆⠂⠀⠀⠀⠀⠀⢹⣿⣿⣿⡆",
                " ⢸⣿⣿⢿⠀⠀⠀⠀⠀⠀⠀⢸⡿⠁⠈⠉⠈⠈⠀⢿⡇⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡇",
                " ⠈⠻⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⡿⠁",
                " ⢀⣤⣌⣙⡛⠛⠳⣦⠀⢀⠄⠀⠢⡆⠀⠀⣰⠀⢀⡄⠀⠀⠀⠀⣤⠞⠛⠛⠋⠁⠀⠀",
                " ⣾⣿⣿⣿⣷⠀⠀⠈⠇⢸⣆⠀⠀⣿⠀⣸⡏⠀⣿⠀⠀⠀⠀⠘⠁⠀⠀⠀⠀⠀⣼⣷",
                " ⠙⢿⣿⣿⣿⡆⠀⠀⠀⠸⣿⣿⣦⠘⣦⢘⠃⣰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡿⠋",
                " ⠀⠀⠉⠉⠉⠉⠀⠀⠀⠀⠉⠋⠉⠁⠸⠌⠠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "",
            },
            -- Alduin
            {
                "",
                "⠀⠀⠀⠀⠀⠀⢀⣀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣴⣾⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⢶⣾⣿⣿⣿⣿⣿⣷⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢋⣻⣿⣿⣿⣿⣦⡄⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⣰⠟⠛⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⢀⡤⠤⣤⢿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀",
                "⠀⠀⠰⠁⠀⠀⠀⢠⡨⠉⠻⣿⣿⣿⣿⣿⣿⣶⠀⠀⠀⠀⠀⣀⣠⢿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀",
                "⠀⠀⠀⠀⢠⣤⣾⣋⣠⣠⣠⣈⣿⣿⣿⣿⣿⣿⣧⣤⣴⣴⣾⠋⠀⣀⣿⣿⣿⣿⣿⣿⣿⣿⠛⠻⣦⠀",
                "⠀⡀⢀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣁⣿⣿⣿⣿⣿⣿⣿⣿⣅⠠⠋⠀",
                "⢰⠿⠛⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠟⠿⣦⣄⠀",
                "⠀⠀⠀⢪⡿⠋⠁⠀⠀⠀⠈⠙⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⡟⠁⠀⠀⠀⠀⠹⡇",
                "⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⢁⠀⠀⠙⠁⠀⠀⠀⠀⠀⠈⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠉⢻⣿⣿⣿⣿⣿⣿⣦⣤⡆⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⢿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠹⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠙⢿⣦⣀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣀⣀⣴⣿⣿⠃⣼⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⢙⣿⣷⣤⣤⣄⣀⣀⠉⠈⡿⣿⢟⠛⣛⣥⣾⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠉⠉⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⢀⡴⠟⠉⠉⠉⠈⠉⠉⠙⠛⠛⠋⠉⠁⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            },
        }

        -- Set header
        dashboard.section.header.val = headers[math.random(#headers)]

        -- Set body
        dashboard.section.buttons.val = {
            dashboard.button("e", "  Edit current directory", ":e .<CR>"),
            dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
            dashboard.button(
                "r",
                "  Recent",
                ":lua require('telescope').extensions.recent_files.pick()<CR>"
            ),
            dashboard.button("z", "󰚸  Notes", ":ZkNotes<CR>"),
            dashboard.button("s", "  Config", ":e $HOME/.config/nvim/<CR>"),
            dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
        }

        -- Set footer
        dashboard.section.footer.val = require("alpha.fortune")()

        -- Setupa alpha
        alpha.setup(dashboard.opts)
    end,
}
