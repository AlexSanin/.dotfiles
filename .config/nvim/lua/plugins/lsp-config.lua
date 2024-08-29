return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    {'williamboman/mason.nvim', config = true},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    -- Set up LSP Zero with on_attach function
    lsp_zero.on_attach(function(client, bufnr)
      -- Default keymaps for LSP
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- Mason setup
    require('mason').setup({})

    -- Mason LSP config setup with specific servers ensured to be installed
    require('mason-lspconfig').setup({
      ensure_installed = {
        "tailwindcss",
        "lua_ls",
        "html",
        "cssls",
        "tsserver",
        "eslint",
        "rust_analyzer",
        "sqlls",
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
