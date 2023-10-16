-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<C-b>", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", ",,", "<cmd>Neotree toggle<cr>", { desc = "Explorer NeoTree (toggle)" })
map("n", "<C-n>", "<C-w><")
map("n", "<C-m>", "<C-w>>")
map("n", "-", "<C-w>-")
map("n", "=", "<C-w>+")
