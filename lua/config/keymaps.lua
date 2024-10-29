-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Defauly keymaps locally: .local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua
local builtin = require("telescope.builtin")
local vkm = vim.keymap.set

-- General
vkm("i", "<A-h>", "<Left>", { noremap = true, silent = true })
vkm("i", "<A-l>", "<Right>", { noremap = true, silent = true })
vkm("n", "<C-M-j>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
vkm("n", "<C-M-k>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vkm("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clears the search" })
vkm("n", "<leader>Y", [["+Y]], { desc = "Yank the current line to system clipboard in normal mode" })
vkm("n", "<leader>bd", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })
vkm("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
vkm("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })
vkm("n", "<leader>qq", ":qa!<CR>", { desc = "Quit everything!" })
vkm("n", "==", "ggVG", { desc = "Select the entire file" })
vkm("n", "J", "mzJ`z", { desc = "Join lines and keep cursor at same position" })
vkm("n", "N", "Nzzzv", { desc = "Previous match; center the line; match is highlighted" })
vkm("n", "Q", "<nop>", { desc = "Disable Q, it usually triggers :Ex" })
vkm("n", "n", "nzzzv", { desc = "Next match; center the line; match is highlighted" })
vkm({ "n", "v" }, "<leader>d", [["_d]], { desc = "Remove without cluttering yank/delete history" })
vkm({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard in n/v mode" })

-- Visual mode
vkm("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vkm("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })
vkm("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-------------------------
-- Tab / ctrl key definitions --
-------------------------
LazyVim.toggle.map("<Tab>ts", LazyVim.toggle("spell", { name = "Toggle Spelling" }))
vkm("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page; keep the current line in center" })
vkm("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page; keep the current line in center" })
vkm("n", "<Tab>a", "zg", { desc = "Spell - Add word to exception list" })
vkm("n", "<Tab>sf", "1z=", { desc = "Spell - Use first correction" })
vkm("n", "<Tab>s", "z=", { desc = "Spell - Suggest spelling corrections" })
vkm("n", "<Tab>sn", "]s", { desc = "Spell - Go to next spelling issue" })
vkm("n", "<Tab>sp", "[s", { desc = "Spell - Go to previous spelling issue" })
vkm("n", "<Tab>tc", _G.ToggleCursorColumn, { desc = "Toggle Cursor Column" })
vkm("n", "<Tab>tm", _G.ToggleMouse, { desc = "Toggle Mouse" })
vkm("n", "<Tab>ts", _G.toggle_spell_check, { desc = "Toggle grammar / spell check" })

-- Telescope
vkm("n", "<leader>.", builtin.oldfiles, { desc = "Telescope recent files" })
vkm("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
