return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              -- That doesn't work in projects with the mutually exclusive dependencies
              allFeatures = false,
            },
            checkOnSave = {
              -- That doesn't work in projects with the mutually exclusive dependencies
              allFeatures = false,
            },
          },
        },
      },
    },
  },
}
