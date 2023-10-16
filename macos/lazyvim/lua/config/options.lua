-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.winbar = "%=%m %f"

-- vim.g.mapleader = ","
-- vim.g.maplocalleader = ","

-- No need backup or swap as there is git
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

-- Paste without yanking the deleted text
-- vim.api.nvim_set_keymap("n", "p", "P", { noremap = true })
-- vim.api.nvim_set_keymap("v", "p", "P", { noremap = true })

-- Adjust the bufferline background color to look better with tokyonight colorscheme
vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#24283b" })
