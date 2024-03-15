local constants = require("core.constants")
local o = vim.opt

local options = {
    backup = false, -- stops creation of a backup file
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect", "noinsert" }, -- mostly just for cmp
    conceallevel = 2, -- concealing fluff in markdown
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = false, -- highlight all matches on previous search pattern
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    ignorecase = true, -- ignore case in search patterns
    smartcase = true, -- with ignorecase, means case sensitive search if a capital is used
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colours (most terminals support this)
    timeoutlen = 50, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- save undo history
    updatetime = 300, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = constants.INDENT_SIZE, -- the number of spaces inserted for each indentation
    tabstop = constants.INDENT_SIZE, -- insert x spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- number column width
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    colorcolumn = constants.LINE_LENGTH, -- coloured column will be drawn this many characters into a line
    scrolloff = 10, -- visible section will move when cursor is this many lines away from the edge of the viewport
    hidden = true, -- buffer remains open in background after being closed
    incsearch = true, -- highlight search pattern in real time
    linebreak = true, -- breaks lines only at characters in "breakat" ( ^I!@*-+;:,./?)
    fillchars = "eob: ", -- replaces ~ symbols with white space characters at the end of buffer
    whichwrap = "<>[]hl", -- set which left->right navigations can also move cursor up or down if at end/start of line
    startofline = true,
    laststatus = 3, -- global status line
    foldmethod = "indent",
    foldlevelstart = 99, -- don't close folds by default when opening buffer
    iskeyword = o.iskeyword + "-", -- characters which are to be counted as 1 "word", added - for easily selecting variables e.g. foo-bar
    spell = true, -- Spellchecking
    spelllang = "en",
    listchars = "tab:→ ,space:·,nbsp:␣,trail:•,eol:↵,precedes:«,extends:»",
    list = false,
}

-- Apply options
for k, v in pairs(options) do
    o[k] = v
end
