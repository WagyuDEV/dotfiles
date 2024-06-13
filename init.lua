-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise the wrong leader key will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set true if a Nerd Font is installed and selected in the terminal
vim.g.have_nerd_font = true

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers EX:
-- 3
-- 2
-- 1
-- 20
-- 1
-- 2
-- 3
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"

-- Dont show the mode
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim
-- Remove this option to keep clipboard seperate
-- See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
-- See `help 'breakindent'`
vim.opt.breakindent = true

-- Save undo history = true
-- See `:help 'undofil'`
vim.opt.undofile = true

--  Ignore case (Case-insensitive) when searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show signcolumn by default
-- See `:help 'signcolumn'`
vim.opt.signcolumn = "yes"

-- Decrease update time
-- If this many milliseconds nothing is typed the swap file will be written to disk 
-- See `:help 'updatetime'`
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
-- tl;dr how long you have to type a key-combo
-- See `help 'timeoutlen'`
vim.opt.timeoutlen = 300

-- Set default split behavior; where splits should be put relative to the focussed pane
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.listchars = { tab = "║ ", trail = "·", nbsp = "␣" }
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

require("config.lazy")
