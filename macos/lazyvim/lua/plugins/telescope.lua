return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>,", vim.NIL }, -- remapped in keymaps
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = false,
            ["<C-p>"] = false,
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-o>"] = "select_default",
          },
        },
      },
    },
  },
}
