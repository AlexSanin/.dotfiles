return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    { 'williamboman/mason.nvim',          config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
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
        "ts_ls",
        "eslint",
        "rust_analyzer",
        "sqlls",
      },
      --handlers = {
      --  lsp_zero.default_setup,
      --},
    })
    -- Automatically install and set up ensure_installed servers
    require('mason-lspconfig').setup_handlers({
      -- Default handler for all installed servers
      function(server_name)
        -- Handle tsserver deprecation and rename to ts_ls
        if server_name == "tsserver" then
          server_name = "ts_ls"
        end

        -- Set up capabilities for autocompletion (nvim-cmp integration)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Use the lsp-zero default setup if no other customization is needed
        require('lspconfig')[server_name].setup({
          on_attach = lsp_zero.on_attach,
          capabilities = capabilities, -- Autocompletion capabilities
        })
      end,
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
