local o = vim.opt
local options = {
    backup = false, -- creates a backup file
    -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect", "noinsert" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = false, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 50, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 4 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- number column width
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    colorcolumn = "89", -- coloured column will be drawn this many characters into a line
    scrolloff = 10, -- visible section will move when cursor is this many lines away from the edge of the viewport
    -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
    hidden = true, -- buffer remains open in background after being closed
    incsearch = true, -- highlight search pattern in real time
    whichwrap = "<>[]hl", -- set which left->right navigations can also move cursor up or down if at end/start of line
    formatoptions = "trnj", -- options for auto wrap and auto format
    iskeyword = o.iskeyword + "-", -- characters which are to be counted as 1 "word", added - for easily selecting variables e.g. foo-bar
}

for k, v in pairs(options) do
    o[k] = v
end
