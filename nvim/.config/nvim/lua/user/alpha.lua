local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
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
    {
        "",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣶⣶⣦⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀",
        "⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀",
        "⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀",
        "⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄",
        "⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧",
        "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠸⣿⣿⣿⣿⠿⠿⠿⢿⣿⣿⣿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⢿⣿⣿⣿⡿⠿⠿⢿⣿⣿⣿⡿",
        "⠀⢿⣿⣿⣿⡄⠀⠀⠸⢿⣿⠟⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠘⢿⣿⡿⠁⠀⠀⣾⣿⣿⣿⠇",
        "⠀⠘⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⡟⠀",
        "⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⠟⢹⠛⢿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⡆⠀",
        "⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⣸⡀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀",
        "⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣠⣼⣿⣷⣤⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀",
        "⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠉⠉⠉⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠈⠉⠁⠈⠉⠁⠉⠉⠀⠉⠉⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "",
    },
    {
        "",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⠿⠿⠿⠿⢿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⣠⣴⣶⣾⣿⣿⠀⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⠀⣿⣿⣷⣶⣤⣀⠀⠀⠀⠀",
        "⠀⠀⣰⣾⣿⡿⠟⠛⠉⠉⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠉⠉⠛⠻⢿⣿⣷⣄⠀⠀",
        "⠀⣼⣿⡿⠋⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀",
        "⢸⣿⣿⠃⠀⠀⣠⣶⣾⣿⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⣿⣷⣦⣄⠀⠀⠸⣿⣿⡆",
        "⢸⣿⣿⠀⢀⣾⣿⡿⠛⠉⠀⣿⣿⡇⠀⠀⣀⣀⠀⠀⠀⠀⠀⣀⣀⠀⠀⢸⣿⣿⠀⠉⠛⢿⣿⣷⡀⠀⣿⣿⡇",
        "⠘⣿⣿⣆⢸⣿⣿⠀⠀⠀⠀⣿⣿⡇⠀⢾⣿⣿⡇⠀⠀⠀⢾⣿⣿⡇⠀⢸⣿⣿⠀⠀⠀⠈⣿⣿⡇⣼⣿⣿⠁",
        "⠀⠙⣿⣿⣿⣿⣿⣄⠀⠀⠀⣿⣿⡇⠀⠈⠙⠋⠀⠀⠀⠀⠈⠙⠋⠀⠀⢸⣿⣿⠀⠀⠀⣰⣿⣿⣿⣿⡿⠃⠀",
        "⠀⠀⠈⠻⢿⣿⣿⣿⣷⣶⣶⣿⣿⣿⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣶⣶⣿⣿⣿⣿⡿⠛⠁⠀⠀",
        "⠀⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠛⠛⠛⠛⢻⣿⣿⠛⣿⣿⣿⢻⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⠀⣿⣿⣿⢸⣿⣿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀",
        "⠀⠀⢀⣀⣀⣈⣉⣉⣉⣉⡉⢹⣿⣿⠀⢸⣿⣿⠀⣿⣿⣿⢸⣿⣿⠀⠀⣿⣿⡏⢉⣉⣉⣉⣉⣁⣀⣀⡀⠀⠀",
        "⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⠀⢸⣿⣿⠀⣿⣿⣿⢸⣿⣿⠀⠀⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⢸⣿⣿⠀⢸⣿⣿⠀⣿⣿⣿⢸⣿⣿⠀⠀⣿⣿⡇⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⢸⣿⣿⠀⢸⣿⣿⠀⣿⣿⣿⢸⣿⣿⠀⠀⣿⣿⡇⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⢸⣿⣿⣄⣼⣿⣿⠀⣿⣿⣿⠸⣿⣿⣆⣠⣿⣿⡇⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣄⠻⢿⣿⣿⠿⢋⣴⣿⣿⣿⣦⡙⠿⣿⣿⡿⠛⣠⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⣶⣤⣴⣶⣿⣿⠿⠙⢿⣿⣿⣶⣦⣴⣶⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⠿⠛⠋⠁⠀⠀⠀⠈⠙⠛⠿⠿⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "",
    },
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
}

-- Set header
dashboard.section.header.val = headers[math.random(#headers)]

-- Set body
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("s", "  Config", ":e $HOME/.config/nvim/<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = require("alpha.fortune")()

-- Setupa alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
