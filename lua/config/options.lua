-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- opt.hlsearch = true -- Highlight all search matches
-- opt.incsearch = true -- Show incremental search results as you type
opt.backup = false
opt.cursorcolumn = false -- Shows cursor vertical position
opt.expandtab = true
opt.guicursor = "" -- disable gui cursor
opt.softtabstop = 2
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.g.have_nerd_font = true
vim.g.python3_host_prog = "/usr/bin/python3"
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit from insert mode", noremap = true })
